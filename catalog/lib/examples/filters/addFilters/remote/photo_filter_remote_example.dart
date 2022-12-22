import 'dart:io';

import 'package:catalog/bloc/interaction_bloc.dart';
import 'package:catalog/models/code_example.dart';
import 'package:flutter/foundation.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoFilterRemoteExample extends CodeExample {
  /// Downloads the file from the [url] to the local temporary directory.
  // highlight-download
  Future<String> _download(String url, String filename) async {
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    final bytes = await consolidateHttpClientResponseBytes(response);
    final outputDirectory = await getTemporaryDirectory();
    final outputFile = File("${outputDirectory.path}/$filename");
    await outputFile.writeAsBytes(bytes);
    return outputFile.path;
  }
  // highlight-download

  @override
  void invoke() async {
    // Disable user interaction.
    // highlight-user-interaction
    InteractionBloc.shared.disable();
    // highlight-user-interaction

    // Download the remote resources.
    // highlight-download
    final thumbnailPath = await _download(
        "https://img.ly/static/example-assets/custom_filter_category.jpg",
        "custom_filter_category.jpg");
    final filterPath = await _download(
        "https://img.ly/static/example-assets/custom_lut_invert.png",
        "custom_lut_invert.png");
    // highlight-download

    // Create [FilterOptions] to configure the filter tool.
    // highlight-filters
    final filterOptions = FilterOptions(categories: [
      // A custom filter category.
      FilterCategory("custom_filter_group", "Custom",
          thumbnailUri: thumbnailPath,
          items: [
            // A custom LUT Filter.
            LutFilter("custom_lut_filter", "Custom LUT", filterPath),
          ]),
    ]);
    // highlight-filters

    // Create a [Configuration] instance.
    final configuration = Configuration(filter: filterOptions);

    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the image.
      print(error);
    } finally {
      // Enable user interaction.
      // highlight-user-interaction
      InteractionBloc.shared.enable();
      // highlight-user-interaction
    }
  }
}

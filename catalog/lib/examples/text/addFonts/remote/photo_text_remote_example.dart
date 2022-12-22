import 'dart:io';

import 'package:catalog/bloc/interaction_bloc.dart';
import 'package:catalog/models/code_example.dart';
import 'package:flutter/foundation.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoTextRemoteExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Disable user interaction.
      // highlight-user-interaction
      InteractionBloc.shared.disable();
      // highlight-user-interaction

      // Download the remote resource before loading it into the editor.
      // highlight-download
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(
          "https://img.ly/static/example-assets/custom_font_raleway_regular.ttf"));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);
      final outputDirectory = await getTemporaryDirectory();
      final outputFile = File('${outputDirectory.path}/LA.jpg');
      await outputFile.writeAsBytes(bytes);
      // highlight-download

      // Create [TextOptions] to customize the text tool.
      // highlight-configuration
      final textOptions = TextOptions(fonts: [
        Font("custom_font_raleway_regular", "custom_font_raleway_regular",
            "Raleway",
            fontUri: outputFile.path)
      ]);

      // Create a [Configuration] instance.
      final configuration = Configuration(text: textOptions);
      // highlight-configuration

      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        return;
      }
    } catch (error) {
      // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
      print(error);
    } finally {
      // Enable user interaction.
      // highlight-user-interaction
      InteractionBloc.shared.enable();
      // highlight-user-interaction
    }
  }
}

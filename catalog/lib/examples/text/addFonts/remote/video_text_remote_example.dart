import 'dart:io';

import 'package:catalog/bloc/interaction_bloc.dart';
import 'package:catalog/models/code_example.dart';
import 'package:flutter/foundation.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoTextRemoteExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Add a video from the assets directory.
      final video = Video("assets/Skater.mp4");

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
      final outputFile = File('${outputDirectory.path}/Skater.mp4');
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

      // Open the video editor and handle the export as well as any occurring errors.
      final result =
          await VESDK.openEditor(video, configuration: configuration);

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`.
        print(result.video);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the video.
      print(error);
    } finally {
      // Enable user interaction.
      // highlight-user-interaction
      InteractionBloc.shared.enable();
      // highlight-user-interaction
    }
  }
}

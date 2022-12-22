import 'dart:io';

import 'package:catalog/bloc/interaction_bloc.dart';
import 'package:catalog/models/code_example.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class OpenVideoRemoteURLExample extends CodeExample {
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
      final request = await client
          .getUrl(Uri.parse("https://img.ly/static/example-assets/Skater.mp4"));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);
      final outputDirectory = await getTemporaryDirectory();
      final outputFile = File('${outputDirectory.path}/Skater.mp4');
      await outputFile.writeAsBytes(bytes);
      // highlight-download

      // Open the video editor and handle the export as well as any occurring errors.
      // highlight-open-editor
      final result = await VESDK.openEditor(Video(outputFile.path));
      // highlight-open-editor

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

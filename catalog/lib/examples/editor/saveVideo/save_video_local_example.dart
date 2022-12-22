import 'dart:io';

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class SaveVideoLocalExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Add a video from the assets directory.
      final video = Video("assets/Skater.mp4");

      // highlight-configuration
      final outputDirectory = await getTemporaryDirectory();
      final filepath =
          "${outputDirectory.uri}export${Platform.isAndroid ? ".mp4" : ""}";
      final configuration =
          Configuration(export: ExportOptions(filename: filepath));
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
    }
  }
}

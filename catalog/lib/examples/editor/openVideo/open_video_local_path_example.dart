import 'package:catalog/models/code_example.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class OpenVideoLocalPathExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Add a video from the assets directory.
      // highlight-open-editor
      final video = Video("assets/Skater.mp4");

      // Open the video editor and handle the export as well as any occurring errors.
      final result = await VESDK.openEditor(video);
      // highlight-open-editor

      // highlight-events
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
    // highlight-events
  }
}

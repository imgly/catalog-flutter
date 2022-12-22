import 'package:catalog/models/code_example.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class OpenVideoCompositionExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Add a video from the assets directory.
      // highlight-clips
      final video = Video.composition(
          videos: ["assets/Skater.mp4", "assets/rollerskates.mp4"]);
      // highlight-clips

      // Open the video editor and handle the export as well as any occurring errors.
      // highlight-open-editor
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

import 'package:catalog/models/code_example.dart';
// highlight-import
import 'package:gallery_saver/gallery_saver.dart';
// highlight-import
import 'package:video_editor_sdk/video_editor_sdk.dart';

class SaveVideoCameraRollExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Add a video from the assets directory.
      final video = Video("assets/Skater.mp4");

      // Open the video editor and handle the export as well as any occurring errors.
      final result = await VESDK.openEditor(video);

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`.
        // For this example, the video is saved to the camera roll.
        // highlight-result
        await GallerySaver.saveVideo(Uri.parse(result.video).path);
        // highlight-result
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

import 'package:catalog/models/code_example.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class OpenVideoCameraRollExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Select an image from the gallery using the [ImagePicker].
      // highlight-select-resource
      final imagePicker = ImagePicker();
      final video = await imagePicker.pickVideo(source: ImageSource.gallery);
      final videoPath = video?.path;
      if (videoPath == null) return;
      // highlight-select-resource

      // highlight-open-editor
      // Open the video editor and handle the export as well as any occurring errors.
      final result = await VESDK.openEditor(Video(videoPath));
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
    }
  }
}

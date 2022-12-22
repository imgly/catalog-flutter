import 'package:catalog/models/code_example.dart';
import 'package:http/http.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class SaveVideoRemoteExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Add a video from the assets directory.
      final video = Video("assets/Skater.mp4");

      // Open the video editor and handle the export as well as any occurring errors.
      final result = await VESDK.openEditor(video);

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`.
        // For this example, the video is uploaded to a remote URL.
        // highlight-result
        final request =
            MultipartRequest('POST', Uri.parse("YOUR-VALID-DESTINATION-URL"));
        request.files.add(
            await MultipartFile.fromPath('file', Uri.parse(result.video).path));
        final response = await request.send();

        if (response.statusCode != 200) {
          throw "There was an error uploading the video.";
        }
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

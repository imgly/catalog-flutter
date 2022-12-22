import 'package:catalog/models/code_example.dart';
import 'package:http/http.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class SavePhotoRemoteExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(image: "assets/LA.jpg");

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        // For this example, the photo is uploaded to a remote URL.
        // highlight-result
        final request =
            MultipartRequest('POST', Uri.parse("YOUR-VALID-DESTINATION-URL"));
        request.files.add(
            await MultipartFile.fromPath('file', Uri.parse(result.image).path));
        final response = await request.send();

        if (response.statusCode != 200) {
          throw "There was an error uploading the photo.";
        }
        // highlight-result
      } else {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        return;
      }
    } catch (error) {
      // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
      print(error);
    }
  }
}

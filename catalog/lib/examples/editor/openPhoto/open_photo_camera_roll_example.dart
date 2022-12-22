import 'package:catalog/models/code_example.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class OpenPhotoCameraRollExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Select an image from the gallery using the [ImagePicker].
      // highlight-select-resource
      final imagePicker = ImagePicker();
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      final imagePath = image?.path;
      if (imagePath == null) return;
      // highlight-select-resource

      // Open the photo editor and handle the export as well as any occurring errors.
      // highlight-open-editor
      final result = await PESDK.openEditor(image: imagePath);
      // highlight-open-editor

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
    }
  }
}

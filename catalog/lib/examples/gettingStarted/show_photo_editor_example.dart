import 'package:catalog/models/code_example.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class ShowPhotoEditorExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      // highlight-open-editor
      final result = await PESDK.openEditor(image: "assets/LA.jpg");
      // highlight-open-editor

      // highlight-events
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
    // highlight-events
  }
}

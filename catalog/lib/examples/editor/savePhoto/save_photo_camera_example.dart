import 'package:catalog/models/code_example.dart';
// highlight-import
import 'package:gallery_saver/gallery_saver.dart';
// highlight-import
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class SavePhotoCameraRollExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(image: "assets/LA.jpg");

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        // For this example, the photo is saved to the camera roll.
        // highlight-result
        await GallerySaver.saveImage(Uri.parse(result.image).path);
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

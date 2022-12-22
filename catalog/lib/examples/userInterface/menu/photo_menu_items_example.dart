import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoMenuItemsExample extends CodeExample {
  @override
  void invoke() async {
    // Create a [Configuration] instance.
    final configuration = Configuration(
        // In this example, the tools are sorted by alphabetical
        // order instead of the default order.
        // highlight-configure
        tools: [
          Tool.adjustment,
          Tool.brush,
          Tool.filter,
          Tool.focus,
          Tool.frame,
          Tool.overlay,
          Tool.sticker,
          Tool.text,
          Tool.textDesign,
          Tool.transform,
        ]
        // highlight-configure
        );
    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

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

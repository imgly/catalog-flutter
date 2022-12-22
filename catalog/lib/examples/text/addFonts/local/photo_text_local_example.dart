import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoTextLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Create [TextOptions] to customize the text tool.
    final textOptions = TextOptions(fonts: [
      // A custom font.
      // highlight-custom
      Font("custom_font_raleway_regular", "custom_font_raleway_regular",
          "Raleway",
          fontUri: "assets/custom_font_raleway_regular.ttf"),
      // highlight-custom
      // A system font.
      // highlight-system
      Font("system_font_helvetica", "Helvetica", "Helvetica")
      // highlight-system
    ]);

    // Create a [Configuration] instance.
    final configuration = Configuration(text: textOptions);

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

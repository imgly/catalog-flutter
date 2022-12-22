import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoFocusConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [FocusOptions] to configure the focus tool.
    final focusOptions = FocusOptions(
        // By default the editor shows all available adjust tools.
        // For this example, the editor should only show a small selection
        // of them.
        // highlight-modes
        items: [
          FocusTool.none,
          FocusTool.radial,
          FocusTool.linear,
        ]
        // highlight-modes
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(focus: focusOptions);

    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the image.
      print(error);
    }
  }
}

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoTextDesignConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [TextDesignOptions] to configure the text design tool.
    final textDesignOptions = TextDesignOptions(
        // By default the editor provides a lot of colors.
        // For this example only a few colors are enabled.
        // highlight-color
        colors: ColorPalette(colors: [
          NamedColor(Color('#ffffff'), "White"),
          NamedColor(Color('#000000'), "Black")
        ]),
        // highlight-color
        // By default the editor has all available overlay actions for this tool
        // enabled. For this example `CanvasAction.UNDO` and `CanvasAction.REDO`
        // are removed.
        // highlight-actions
        canvasActions: [
          TextDesignCanvasAction.add,
          TextDesignCanvasAction.bringToFront,
          TextDesignCanvasAction.delete,
          TextDesignCanvasAction.invert
        ]
        // highlight-actions
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(textdesign: textDesignOptions);

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

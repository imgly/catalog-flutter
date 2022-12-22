import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoStickerConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [StickerOptions] to customize the sticker tool.
    final stickerOptions = StickerOptions(
        // By default, the user is not allowed to add
        // custom stickers from the local library. For
        // this example, this option is enabled.
        // highlight-personal
        personalStickers: true,
        // highlight-personal

        // By default, the default tint mode for personal stickers
        // is set to `TintMode.none`. For this example, this is set
        // to `TintMode.solid`
        // highlight-default-tint-mode
        defaultPersonalStickerTintMode: TintMode.solid,
        // highlight-default-tint-mode

        // By default, a lot of colors are enabled.
        // For this example, only a small selection
        // is enabled.
        // highlight-colors
        colors: ColorPalette(colors: [
          NamedColor(Color([1, 1, 1, 1]), "White"),
          NamedColor(Color([0, 0, 0, 1]), "Black"),
        ]),
        // highlight-colors

        // By default, all available canvas actions are enabled.
        // For this example, the user is only allowed to undo
        // and redo changes.
        // highlight-canvas-actions
        canvasActions: [StickerCanvasAction.undo, StickerCanvasAction.redo],
        // highlight-canvas-actions

        // By default, all available sticker actions are enabled.
        // For this example, only a few tools are enabled.
        // highlight-actions
        actions: [StickerAction.color, StickerAction.replace]
        // highlight-actions
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(sticker: stickerOptions);

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

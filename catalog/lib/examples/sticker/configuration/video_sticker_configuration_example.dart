import 'dart:ui';

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoStickerConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

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
          NamedColor(const Color.fromARGB(255, 255, 255, 255), "White"),
          NamedColor(const Color.fromARGB(0, 0, 0, 255), "Black"),
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
      // Open the video editor and handle the export as well as any occurring errors.
      final result =
          await VESDK.openEditor(video, configuration: configuration);

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`.
        print(result.video);
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

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoAnnotationExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // For this example only stickers suitable for annotations are enabled.
    // Therefore, create a custom [StickerCategory] to assign the options.
    // highlight-stickers
    final stickerCategory = StickerCategory(
        "annotation_stickers", "Annotation", "assets/sticker_thumbnail.png",
        items: [
          Sticker.existing("imgly_sticker_shapes_arrow_02"),
          Sticker.existing("imgly_sticker_shapes_arrow_03"),
          Sticker.existing("imgly_sticker_shapes_badge_11"),
          Sticker.existing("imgly_sticker_shapes_badge_12"),
          Sticker.existing("imgly_sticker_shapes_badge_36")
        ]);

    // Load the custom sticker category into the [StickerOptions].
    final stickerOptions = StickerOptions(categories: [stickerCategory]);
    // highlight-stickers

    // Create a [Configuration] instance.
    final configuration = Configuration(
        // highlight-menu
        tools: [Tool.sticker, Tool.text, Tool.brush],
        // highlight-menu
        sticker: stickerOptions);

    try {
      // Open the video editor and handle the export as well as any occurring errors.
      // highlight-open-editor
      final result =
          await VESDK.openEditor(video, configuration: configuration);
      // highlight-open-editor

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

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoStickerRemoteExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Create [StickerOptions] to customize the sticker tool.
    //
    // The sticker tool is optimized for remote resources which allows to directly
    // integrate a remote URL instead of downloading the asset before. For an
    // example on how to download the remote resources in advance and use the local
    // downloaded resources, see: lib/examples/text/addFonts/remote.
    final stickerOptions = StickerOptions(categories: [
      // A custom sticker category.
      // highlight-custom-category
      StickerCategory("custom", "Custom",
          "https://img.ly/static/example-assets/custom_sticker_igor.png",
          items: [
            // A custom sticker.
            // highlight-custom-sticker
            Sticker("custom_sticker_igor", "Igor",
                "https://img.ly/static/example-assets/custom_sticker_igor.png"),
            // highlight-custom-sticker

            // An existing sticker.
            // highlight-existing-sticker
            Sticker.existing("imgly_sticker_shapes_badge_01")
            // highlight-existing-sticker
          ]),
      // highlight-custom-category

      // An existing sticker category.
      // highlight-category
      StickerCategory.existing("imgly_sticker_category_emoticons")
      // highlight-category
    ]);

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

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoStickerLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Create [StickerOptions] to customize the sticker tool.
    final stickerOptions = StickerOptions(categories: [
      // A custom sticker category.
      // highlight-custom-category
      StickerCategory("custom", "Custom", "assets/custom_sticker_igor.png",
          items: [
            // A custom sticker.
            // highlight-custom-sticker
            Sticker("custom_sticker_igor", "Igor",
                "assets/custom_sticker_igor.png"),
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

import 'package:imgly_sdk/imgly_sdk.dart';

void example() {
  // <smart-stickers>
  // Create [StickerOptions] to customize the sticker tool.
  final stickerOptions = StickerOptions(categories: [
    StickerCategory("custom", "Smart", "assets/custom_sticker_igor.png",
        items: [
          Sticker.existing("imgly_smart_sticker_weekday"),
          Sticker.existing("imgly_smart_sticker_date"),
          Sticker.existing("imgly_smart_sticker_time"),
          Sticker.existing("imgly_smart_sticker_time_clock")
        ])
  ]);

  // Create a [Configuration] instance to apply the customizations.
  final configuration = Configuration(sticker: stickerOptions);
  // <smart-stickers>
}

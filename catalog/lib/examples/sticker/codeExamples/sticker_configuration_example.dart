import 'package:imgly_sdk/imgly_sdk.dart';

void example() {
  // <personal-stickers>
  // Create [StickerOptions] to customize the sticker tool.
  final stickerOptions = StickerOptions(
      personalStickers: true, defaultPersonalStickerTintMode: TintMode.none);

  // Create a [Configuration] instance to apply the customizations.
  final configuration = Configuration(sticker: stickerOptions);
  // <personal-stickers>
}

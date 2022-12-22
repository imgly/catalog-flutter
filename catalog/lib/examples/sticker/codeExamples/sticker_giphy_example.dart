import 'package:imgly_sdk/imgly_sdk.dart';

void example() {
  // example-giphy
  // Create a GIPHY sticker category.
  final giphyProvider = GiphyStickerProvider("YOUR-API-KEY");
  final giphyCategory = StickerCategory.giphy(giphyProvider);
  final stickerOptions = StickerOptions(categories: [giphyCategory]);

  // Create a [Configuration] instance.
  final configuration = Configuration(sticker: stickerOptions);
  // example-giphy
}

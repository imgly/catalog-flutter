import 'package:imgly_sdk/imgly_sdk.dart';

void example() {
  // example-categories
  final audioOptions = AudioOptions(categories: [
    AudioClipCategory("custom", "Custom",
        items: [AudioClip("elsewhere", "assets/elsewhere.mp3")])
  ]);
  final configuration = Configuration();
  // example-categories
}

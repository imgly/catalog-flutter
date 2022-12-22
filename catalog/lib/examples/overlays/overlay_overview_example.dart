import 'package:imgly_sdk/imgly_sdk.dart';

void _example() async {
  // example-overlays
  final overlayOptions = OverlayOptions(items: [
    Overlay("custom_overlay", "Custom", BlendMode.overlay,
        "assets/imgly_overlay_grain.jpg")
  ]);
  final configuration = Configuration(overlay: overlayOptions);
  // example-overlays
}

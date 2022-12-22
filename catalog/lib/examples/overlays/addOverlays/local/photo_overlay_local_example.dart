import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoOverlayLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Create [OverlayOptions] to configure the overlay tool.
    final overlayOptions = OverlayOptions(items: [
      // highlight-custom-overlay
      Overlay("custom_overlay", "Custom", BlendMode.overlay,
          "assets/imgly_overlay_grain.jpg"),
      // highlight-custom-overlay
      // highlight-existing-overlay
      Overlay.existing("imgly_overlay_rain"),
      Overlay.existing("imgly_overlay_mosaic")
      // highlight-existing-overlay
    ]);

    // Create a [Configuration] instance.
    final configuration = Configuration(overlay: overlayOptions);

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

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoOverlayRemoteExample extends CodeExample {
  @override
  void invoke() async {
    // Create [OverlayOptions] to configure the overlay tool.
    //
    // The overlay tool is optimized for remote resources which allows to directly
    // integrate a remote URL instead of downloading the asset before. For an
    // example on how to download the remote resources in advance and use the local
    // downloaded resources, see: lib/examples/text/addFonts/remote.
    final overlayOptions = OverlayOptions(items: [
      // highlight-custom-overlay
      Overlay("custom_overlay", "Custom", BlendMode.overlay,
          "https://img.ly/static/example-assets/imgly_overlay_grain.jpg"),
      // highlight-custom-overlay
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

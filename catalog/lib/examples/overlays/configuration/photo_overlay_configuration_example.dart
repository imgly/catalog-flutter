import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoOverlayConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [OverlayOptions] to configure the overlay tool.
    final overlayOptions = OverlayOptions(
        // By default, all available blend modes are enabled.
        // For this example, only a couple are enabled for usage.
        // highlight-modes
        blendModes: [
          BlendMode.colorBurn,
          BlendMode.darken,
          BlendMode.hardLight,
          BlendMode.lighten
        ]
        // highlight-modes
        );

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

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoTransformConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [TransformOptions] to configure the transform feature.
    final transformOptions = TransformOptions(
        // By default the editor has a lot of crop aspects enabled.
        // For this example only a couple are enabled, e.g. if you
        // only allow certain video aspects in your application.
        // highlight-crop-ratios
        items: [CropRatio(1, 1), CropRatio(16, 9, name: "Landscape")],
        // highlight-crop-ratios

        // By default the editor allows to use a free crop ratio.
        // For this example this is disabled to ensure that the video
        // has a suitable ratio.
        // highlight-free-crop
        allowFreeCrop: false,
        // highlight-free-crop

        // By default the editor shows the reset button which resets
        // the applied transform operations. In this example the button
        // is hidden since we are enforcing certain ratios and the user
        // can only select among them anyway.
        // highlight-reset-button
        showResetButton: false
        // highlight-reset-button
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(
        transform: transformOptions,
        // For this example the user is forced to crop the asset to one of
        // the allowed crop aspects specified above, before being able to use other
        // features of the editor. The transform tool will only be presented
        // if the video does not already fit one of those allowed aspect ratios.
        // highlight-force-crop
        forceCrop: true
        // highlight-force-crop
        );

    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the image.
      print(error);
    }
  }
}

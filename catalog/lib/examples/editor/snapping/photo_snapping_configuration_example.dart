import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoSnappingConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [SnappingOptions] to configure the snapping behavior.
    final snappingOptions = SnappingOptions(
        // The [RotationSnappingOptions] allow to modify the snapping behavior
        // for rotating a sprite.
        rotation: RotationSnappingOptions(
            // By default the snapping is enabled when rotating a sprite.
            // For this example this behavior is disabled since only the
            // outer positional snapping guides are needed.
            // highlight-rotation
            enabled: false
            // highlight-rotation
            ),

        // The [PositionSnappingOptions] allow to modify the snapping behavior
        // for moving a sprite.
        position: PositionSnappingOptions(
            // By default the center of the sprite snaps to a vertical
            // line indicating the center of the image.
            // For this example this behavior is disabled since only the
            // outer positional snapping guides are needed.
            // highlight-vertical-line
            snapToVerticalCenter: false,
            // highlight-vertical-line

            // By default the center of the sprite snaps to a horizontal
            // line indicating the center of the image.
            // For this example this behavior is disabled since only the
            // outer positional snapping guides are needed.
            // highlight-horizontal-line
            snapToHorizontalCenter: false,
            // highlight-horizontal-line

            // By default the sprite snaps to a horizontal line
            // on the bottom of the image. This value is measured in normalized
            // coordinates relative to the smaller side of the edited image and
            // defaults to 10% (0.1).
            // For this example the value is set to 15% (0.15) to define the
            // visibility area of the image.
            // highlight-positional
            snapToBottom: 0.15,

            // By default the sprite snaps to a horizontal line
            // on the top of the image. This value is measured in normalized
            // coordinates relative to the smaller side of the edited image and
            // defaults to 10% (0.1).
            // For this example the value is set to 15% (0.15) to define the
            // visibility area of the image.
            snapToTop: 0.15,

            // By default the sprite snaps to a vertical line
            // on the left of the image. This value is measured in normalized
            // coordinates relative to the smaller side of the edited image and
            // defaults to 10% (0.1).
            // For this example the value is set to 15% (0.15) to define the
            // visibility area of the image.
            snapToLeft: 0.15,

            // By default the sprite snaps to a vertical line
            // on the right of the image. This value is measured in normalized
            // coordinates relative to the smaller side of the edited image and
            // defaults to 10% (0.1).
            // For this example the value is set to 15% (0.15) to define the
            // visibility area of the image.
            snapToRight: 0.15
            // highlight-positional
            ));

    // Create a [Configuration] instance.
    final configuration = Configuration(snapping: snappingOptions);

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

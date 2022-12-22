import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoAdjustmentsConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [AdjustmentOptions] to configure the adjustments tool.
    final adjustmentOptions = AdjustmentOptions(
        // By default the editor always shows the reset button.
        // For this example, the reset button should not be shown.
        // highlight-reset
        showResetButton: false,
        // highlight-reset

        // By default the editor shows all available adjust tools.
        // For this example, the editor should only show a small selection
        // of them.
        // highlight-tools
        items: [
          AdjustmentTool.brightness,
          AdjustmentTool.contrast,
          AdjustmentTool.saturation,
        ]
        // highlight-tools
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(adjustment: adjustmentOptions);

    try {
      // Add a video from the assets directory.
      final video = Video("assets/Skater.mp4");

      // Open the video editor and handle the export as well as any occurring errors.
      final result =
          await VESDK.openEditor(video, configuration: configuration);

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`.
        print(result.video);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the video.
      print(error);
    }
  }
}

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoOverlayLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

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

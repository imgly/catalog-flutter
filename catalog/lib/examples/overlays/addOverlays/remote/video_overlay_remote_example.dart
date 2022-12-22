import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoOverlayRemoteExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

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

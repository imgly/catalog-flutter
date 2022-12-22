import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoOverlayConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

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

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoTextLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Create [TextOptions] to customize the text tool.
    final textOptions = TextOptions(fonts: [
      // A custom font.
      // highlight-custom
      Font("custom_font_raleway_regular", "custom_font_raleway_regular",
          "Raleway",
          fontUri: "assets/custom_font_raleway_regular.ttf"),
      // highlight-custom
      // A system font.
      // highlight-system
      Font("system_font_helvetica", "Helvetica", "Helvetica")
      // highlight-system
    ]);

    // Create a [Configuration] instance.
    final configuration = Configuration(text: textOptions);

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

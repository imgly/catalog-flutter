import 'dart:ui';

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoTextConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Create [TextOptions] to customize the text tool.
    final textOptions = TextOptions(
        // By default the editor allows all available text actions.
        // For this example, we only allow changing the colors.
        // highlight-actions
        actions: [TextAction.color, TextAction.backgroundColor],
        // highlight-actions

        // By default the editor allows to add emojis as text input.
        // Since emojis are not cross-platform compatible, using the serialization
        // feature to share edits across different platforms will result in emojis
        // being rendered with the system's local set of emojis and therefore will
        // appear differently.
        // For this example emoji input is disabled to ensure a consistent cross-platform experience.
        // highlight-emoji
        allowEmojis: false,
        // highlight-emoji

        // By default the editor provides a variety of different
        // colors to customize the background color of the text.
        // For this example only a small selection of colors is shown by default
        // e.g. based on favorite colors of the user.
        // highlight-background-color
        backgroundColors: ColorPalette(colors: [
          NamedColor(const Color.fromARGB(230, 255, 0, 0), "Red"),
          NamedColor(const Color.fromARGB(255, 0, 255, 34), "Green"),
          NamedColor(const Color.fromARGB(255, 238, 255, 0), "Yellow")
        ]),
        // highlight-background-color

        // By default the editor provides a variety of different
        // colors to customize the color of the text.
        // For this example only a small selection of colors is shown by default
        // e.g. based on favorite colors of the user.
        // highlight-text-color
        textColors: ColorPalette(colors: [
          NamedColor(const Color.fromARGB(255, 255, 255, 255), "White"),
          NamedColor(const Color.fromARGB(0, 0, 0, 255), "Black"),
        ]),
        // highlight-text-color

        // By default the default text color is set to
        // Color.fromRGBA(255, 255, 255, 255).
        // For this example, the default color is set to black.
        // highlight-default-color
        defaultTextColor: const Color.fromARGB(0, 0, 0, 255)
        // highlight-default-color
        );

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

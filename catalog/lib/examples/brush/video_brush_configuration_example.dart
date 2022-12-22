import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoBrushConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [BrushOptions] to configure the brush tool.
    final brushOptions = BrushOptions(
        // By default all available brush tools are enabled.
        // For this example only a couple are enabled.
        // highlight-tools
        actions: [BrushAction.color, BrushAction.size],
        // highlight-tools

        // By default the default color for the brush stroke is
        // `#ffffff`. For this example the default color
        // is set to `#000000`.
        // highlight-color
        defaultColor: Color("#000000"),
        // highlight-color

        // By default the default brush size is set to 5% of the
        // smaller side of the video.
        // For this example the default size is set to be 2.5% of
        // the smaller side of the video.
        // highlight-size
        defaultSize: 0.025,
        // highlight-size

        // By default the editor provides a variety of different
        // colors to customize the color of the brush stroke.
        // For this example only a small selection of colors is enabled.
        // highlight-colors
        colors: ColorPalette(colors: [
          NamedColor(Color("#ffffff"), "White"),
          NamedColor(Color("#000000"), "Black"),
          NamedColor(Color("ff0000"), "Red")
        ])
        // highlight-colors
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(brush: brushOptions);

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

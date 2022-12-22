import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoTextDesignConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [TextDesignOptions] to configure the text design tool.
    final textDesignOptions = TextDesignOptions(
        // By default the editor provides a lot of colors.
        // For this example only a few colors are enabled.
        // highlight-color
        colors: ColorPalette(colors: [
          NamedColor(Color('#ffffff'), "White"),
          NamedColor(Color('#000000'), "Black")
        ]),
        // highlight-color
        // By default the editor has all available overlay actions for this tool
        // enabled. For this example `CanvasAction.UNDO` and `CanvasAction.REDO`
        // are removed.
        // highlight-actions
        canvasActions: [
          TextDesignCanvasAction.add,
          TextDesignCanvasAction.bringToFront,
          TextDesignCanvasAction.delete,
          TextDesignCanvasAction.invert
        ]
        // highlight-actions
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(textdesign: textDesignOptions);

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

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoSingleToolExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Create a [Configuration] instance.
    final configuration = Configuration(
        // In this example, the single tool mode is enabled.
        // highlight-configure
        singleToolMode: true,
        // highlight-configure
        // To determine which tool is used, we need to assign it.
        // For this example, we only use the transform tool.
        // highlight-configure
        tools: [Tool.transform]
        // highlight-configure
        );

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

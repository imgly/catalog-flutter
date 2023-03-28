import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoSegmentsSerializationExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Create [ExportOptions] to configure the video export.
      // highlight-serialization
      final exportOptions = ExportOptions(video: VideoOptions(segments: true));

      // Create a [Configuration] instance.
      final configuration = Configuration(export: exportOptions);
      // highlight-serialization

      // Add a video from the assets directory.
      final video = Video("assets/Skater.mp4");

      // Open the video editor and handle the export as well as any occurring errors.
      final result =
          await VESDK.openEditor(video, configuration: configuration);

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`
        // and the serialization is located at `result.serialization`.
        // highlight-usage
        print(result.toJson());

        // Once you have processed the serialized segments, you need to release the
        // result.
        result.release();
        // highlight-usage
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the video.
      print(error);
    }
    // highlight-events
  }
}

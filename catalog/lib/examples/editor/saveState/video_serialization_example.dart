import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoSerializationExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Create [SerializationOptions] to configure the serialization feature.
      // highlight-serialization
      final serializationOptions = SerializationOptions(
          // Enable the serialization feature.
          enabled: true,

          // For this example, the serialization should be returned
          // as an object to simply logging it in the console.
          exportType: SerializationExportType.object);

      // Create [ExportOptions] to apply the [serializationOptions].
      final exportOptions = ExportOptions(serialization: serializationOptions);

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
        print(result.serialization);
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

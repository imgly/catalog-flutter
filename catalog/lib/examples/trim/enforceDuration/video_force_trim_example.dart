import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoForceTrimExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Create [TrimOptions].
    // The duration limits of these configuration options are
    // also respected by the composition tool.
    final trimOptions = TrimOptions(
        // By default the editor does not limit the maximum video duration.
        // For this example the duration is set, e.g. for a social
        // media application where the posts are not allowed to be
        // shorter than 2 seconds.
        minimumDuration: 2,

        // By default the editor does not have a maximum duration.
        // For this example the duration is set, e.g. for a social
        // media application where the posts are not allowed to be
        // longer than 5 seconds.
        maximumDuration: 5,

        // By default the editor trims the video automatically if it is
        // longer than the specified maximum duration. For this example the user
        // is prompted to review and adjust the automatically trimmed video.
        // highlight-force-trim
        forceMode: ForceTrimMode.ifNeeded
        // highlight-force-trim
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(trim: trimOptions);

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

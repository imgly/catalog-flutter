import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoCompositionConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Create new video clip categories with custom video clips from
    // the app bundle.
    final videoClipCategories = [
      VideoClipCategory("misc", "Misc", items: [
        VideoClip("delivery", "assets/delivery.mp4"),
        VideoClip("notes", "assets/notes.mp4")
      ]),
      VideoClipCategory("people", "People", items: [
        VideoClip("dj", "assets/dj.mp4"),
        VideoClip("rollerskates", "assets/rollerskates.mp4")
      ]),
    ];

    // Create [CompositionOptions] to apply the customizations for the
    // composition tool.
    final compositionOptions = CompositionOptions(
        categories: videoClipCategories,
        // By default the user is allowed to add personal video clips
        // from the device. For this example the user is only allowed
        // to add video clips that are predefined in the editor configuration.
        personalVideoClips: false);

    // Create a [Configuration] instance.
    final configuration = Configuration(composition: compositionOptions);

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

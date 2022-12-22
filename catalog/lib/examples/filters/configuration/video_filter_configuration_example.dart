import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoFilterConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [FilterOptions] to configure the filter tool.
    final filterOptions = FilterOptions(
        // By default, the filters are grouped according to the filter
        // categories passed to the configuration. In this example,
        // the filter grouping is disabled so that all
        // available filters will be displayed separately.
        // highlight-flatten
        flattenCategories: true
        // highlight-flatten
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(filter: filterOptions);

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

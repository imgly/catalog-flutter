import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoFilterLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Create [FilterOptions] to configure the filter tool.
    final filterOptions = FilterOptions(categories: [
      // A custom filter category.
      // highlight-category
      FilterCategory("custom_filter_group", "Custom",
          thumbnailUri: "assets/custom_filter_category.jpg",
          items: [
            // A custom LUT Filter.
            // highlight-custom-filter
            LutFilter("custom_lut_filter", "Custom LUT",
                "assets/custom_lut_invert.png"),

            // A custom DuoTone Filter.
            DuoToneFilter("custom_duotone_filter", "Custom DuoTone",
                Color("#002259"), Color("#bd66ff"))
            // highlight-custom-filter
          ]),
      // highlight-category
      // An existing filter category from the sdk.
      // highlight-existing
      FilterCategory.existing("imgly_filter_category_bw")
      // highlight-existing
    ]);

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

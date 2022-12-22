import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoFilterConfigurationExample extends CodeExample {
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
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the image.
      print(error);
    }
  }
}

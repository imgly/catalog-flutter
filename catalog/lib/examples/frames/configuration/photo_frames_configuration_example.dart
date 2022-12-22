import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoFramesConfigurationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [FrameOptions] to customize the frame tool.
    final frameOptions = FrameOptions(
        // By default all actions are enabled in the frame tool.
        // For this example only two of them are enabled.
        // highlight-actions
        actions: [FrameAction.opacity, FrameAction.replace]
        // highlight-actions
        );

    // Create a [Configuration] instance.
    final configuration = Configuration(frame: frameOptions);

    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        return;
      }
    } catch (error) {
      // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
      print(error);
    }
  }
}

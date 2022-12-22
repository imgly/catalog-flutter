import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoFramesLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Create an [ImageGroupSet] to assign the local assets for
    // a custom frame.
    // highlight-groups
    final imageGroupSet = ImageGroupSet(
        top: FrameImageGroup("assets/imgly_frame_lowpoly_top.png",
            startUri: "assets/imgly_frame_lowpoly_top_left.png",
            endUri: "assets/imgly_frame_lowpoly_top_right.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ),
        left: FrameImageGroup("assets/imgly_frame_lowpoly_left.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ),
        right: FrameImageGroup("assets/imgly_frame_lowpoly_right.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ),
        bottom: FrameImageGroup("assets/imgly_frame_lowpoly_bottom.png",
            startUri: "assets/imgly_frame_lowpoly_bottom_left.png",
            endUri: "assets/imgly_frame_lowpoly_bottom_right.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ));
    // highlight-groups

    // Create [FrameOptions] to customize the frame tool.
    final frameOptions = FrameOptions(items: [
      // highlight-basic
      Frame("custom_frame", "Custom", imageGroupSet, 0.1,
          "assets/imgly_frame_lowpoly_thumbnail.png",
          layoutMode: FrameLayoutMode.horizontalInside)
      // highlight-basic
    ]);

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

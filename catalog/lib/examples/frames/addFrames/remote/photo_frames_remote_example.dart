import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoFramesRemoteExample extends CodeExample {
  @override
  void invoke() async {
    // For the sake of readability, the base URL of all remote URLs is
    // extracted in this example.
    const baseUrl = "https://img.ly/static/example-assets";

    // Create an [ImageGroupSet] to assign the local assets for
    // a custom frame.
    //
    // The frame tool is optimized for remote resources which allows to directly
    // integrate a remote URL instead of downloading the asset before. For an
    // example on how to download the remote resources in advance and use the local
    // downloaded resources, see: src/examples/text/addFonts/fromRemoteURL.
    //
    // By default the `midMode` is set to `FrameTileMode.REPEAT` which repeats
    // the middle image to fill out the entire space.
    // For this example it is set to `FrameTileMode.STRETCH` for all image groups
    // to keep the correct pattern. In this mode, the middle image is
    // stretched to fill out the entire space.
    // highlight-groups
    final imageGroupSet = ImageGroupSet(
        top: FrameImageGroup("$baseUrl/imgly_frame_lowpoly_top.png",
            startUri: "$baseUrl/imgly_frame_lowpoly_top_left.png",
            endUri: "$baseUrl/imgly_frame_lowpoly_top_right.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ),
        left: FrameImageGroup("$baseUrl/imgly_frame_lowpoly_left.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ),
        right: FrameImageGroup("$baseUrl/imgly_frame_lowpoly_right.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ),
        bottom: FrameImageGroup("$baseUrl/imgly_frame_lowpoly_bottom.png",
            startUri: "$baseUrl/imgly_frame_lowpoly_bottom_left.png",
            endUri: "$baseUrl/imgly_frame_lowpoly_bottom_right.png",
            // highlight-mid-mode
            midMode: FrameTileMode.stretch
            // highlight-mid-mode
            ));
    // highlight-groups

    // Create [FrameOptions] to customize the frame tool.
    final frameOptions = FrameOptions(items: [
      // highlight-basic
      Frame("custom_frame", "Custom", imageGroupSet, 0.1,
          "$baseUrl/imgly_frame_lowpoly_thumbnail.png",
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

import 'package:catalog/models/code_example.dart';
import 'package:flutter/material.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoSegmentsDeserializationExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // Add a video consisting out of video segments.
      // highlight-serialization
      final video = Video.fromSegments(segments: [
        VideoSegment("assets/Skater.mp4", startTime: 0.5, endTime: 2.5)
      ], size: const Size(450, 450));
      // highlight-serialization

      // Open the video editor and handle the export as well as any occurring errors.
      // highlight-open-editor
      final result = await VESDK.openEditor(video);
      // highlight-open-editor

      if (result != null) {
        // The user exported a new video successfully and the newly generated video is located at `result.video`
        // and the serialization is located at `result.serialization`.
        print(result.serialization);
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

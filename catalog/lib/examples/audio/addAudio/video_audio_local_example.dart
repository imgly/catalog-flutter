import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoAudioLocalExample extends CodeExample {
  @override
  void invoke() async {
    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Sources of the local audio clips.
    // highlight-process
    final audioSources = [
      "elsewhere",
      "trapped_in_the_upside_down",
      "dance_harder",
      "far_from_home"
    ];

    // Convert the sources to valid `AudioClip`s.
    final List<AudioClip> audioClips = audioSources
        .map((clip) => AudioClip(clip, "assets/$clip.mp3"))
        .toList();
    // highlight-process

    // Create [AudioOptions] to customize the audio tool.
    final audioOptions = AudioOptions(
      // highlight-configuration
      categories: [
        AudioClipCategory("elsewhere", "Elsewhere",
            items: audioClips.sublist(0, 2)),
        AudioClipCategory("other", "Other", items: audioClips.sublist(2))
      ],
      // highlight-configuration
    );

    // Create a [Configuration] instance.
    final configuration = Configuration(audio: audioOptions);

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

import 'dart:io';

import 'package:catalog/bloc/interaction_bloc.dart';
import 'package:catalog/models/code_example.dart';
import 'package:flutter/foundation.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoAudioRemoteExample extends CodeExample {
  /// Downloads the file from the [url] to the local temporary directory.
  // highlight-download
  Future<String> _download(String url, String filename) async {
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    final bytes = await consolidateHttpClientResponseBytes(response);
    final outputDirectory = await getTemporaryDirectory();
    final outputFile =
        File.fromUri(Uri.parse("${outputDirectory.uri}/$filename"));
    await outputFile.writeAsBytes(bytes);
    return outputFile.uri.toString();
  }
  // highlight-download

  @override
  void invoke() async {
    // Disable user interaction.
    // highlight-user-interaction
    InteractionBloc.shared.disable();
    // highlight-user-interaction

    // Add a video from the assets directory.
    final video = Video("assets/Skater.mp4");

    // Sources of the local audio clips.
    // highlight-download
    final audioSources = [
      "elsewhere",
      "trapped_in_the_upside_down",
      "dance_harder",
      "far_from_home"
    ];

    final List<Future<String>> downloads = audioSources
        .map((e) =>
            _download("https://img.ly/static/example-assets/$e.mp3", "$e.mp3"))
        .toList();
    final List<String> localPaths = await Future.wait(downloads);
    // highlight-download

    // Convert the sources to valid `AudioClip`s.
    // highlight-process
    final List<AudioClip> audioClips = audioSources
        .asMap()
        .entries
        .map((clip) => AudioClip(clip.value, localPaths[clip.key]))
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
    } finally {
      // Enable user interaction.
      // highlight-user-interaction
      InteractionBloc.shared.enable();
      // highlight-user-interaction
    }
  }
}

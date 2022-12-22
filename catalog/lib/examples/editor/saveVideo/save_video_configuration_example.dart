import 'package:imgly_sdk/imgly_sdk.dart';

void example() {
  // code-example
  // Create [ExportOptions] to customize the export.
  final exportOptions = ExportOptions(
      // The name of the exported file.
      // This needs to be a valid URI you have write access to.
      // highlight-filename
      filename: "YOUR_VALID_FILENAME",
      // highlight-filename

      // Create [VideoOptions] to customize the export for a video.
      video: VideoOptions(
          // The video export format determines the file format in which the video should be exported.
          // In this configuration example, the video should be exported as a MP4.
          // highlight-format
          format: VideoFormat.mp4,
          // highlight-format

          // The video codec to use for the exported video.
          // In this configuration example, the video should be exported with a `.h264` codec.
          // highlight-codec
          codec: VideoCodec.h264,
          // highlight-codec

          // The bit rate in bits per second to use when exporting to `VideoCodec.H264`.
          // In this configuration example, the bit rate is set to 3840.
          // highlight-bit-rate
          bitRate: 3840,
          // highlight-bit-rate

          // The video export quality determines the compression quality in which the video
          // should be exported when exporting to `VideoCodec.HEVC`.
          // In this configuration example, the video only has an output compression quality of 50% - although this
          // would not take any effect since the codec is set to `VideoCodec.H264`.
          // highlight-quality
          quality: 0.5
          // highlight-quality
          ));

  // Create a [Configuration] instance.
  final configuration = Configuration(export: exportOptions);
  // code-example
}

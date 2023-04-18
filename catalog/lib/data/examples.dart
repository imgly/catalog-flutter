import 'package:catalog/examples/adjustments/photo_adjustments_configuration_example.dart';
import 'package:catalog/examples/adjustments/video_adjustments_configuration_example.dart';
import 'package:catalog/examples/audio/addAudio/video_audio_local_example.dart';
import 'package:catalog/examples/audio/addAudio/video_audio_remote_example.dart';
import 'package:catalog/examples/audio/configuration/video_audio_configuration_example.dart';
import 'package:catalog/examples/brush/photo_brush_configuration_example.dart';
import 'package:catalog/examples/brush/video_brush_configuration_example.dart';
import 'package:catalog/examples/editor/openPhoto/open_photo_camera_roll_example.dart';
import 'package:catalog/examples/editor/openPhoto/open_photo_local_path_example.dart';
import 'package:catalog/examples/editor/openPhoto/open_photo_remote_url_example.dart';
import 'package:catalog/examples/editor/openVideo/open_video_camera_roll_example.dart';
import 'package:catalog/examples/editor/openVideo/open_video_composition_example.dart';
import 'package:catalog/examples/editor/openVideo/open_video_local_path_example.dart';
import 'package:catalog/examples/editor/openVideo/open_video_remote_url_example.dart';
import 'package:catalog/examples/editor/restoreState/photo_deserialization_example.dart';
import 'package:catalog/examples/editor/restoreState/video_deserialization_example.dart';
import 'package:catalog/examples/editor/restoreState/video_segments_deserialization_example.dart';
import 'package:catalog/examples/editor/savePhoto/save_photo_base64_example.dart';
import 'package:catalog/examples/editor/savePhoto/save_photo_camera_example.dart';
import 'package:catalog/examples/editor/savePhoto/save_photo_local_example.dart';
import 'package:catalog/examples/editor/savePhoto/save_photo_remote_example.dart';
import 'package:catalog/examples/editor/saveState/photo_serialization_example.dart';
import 'package:catalog/examples/editor/saveState/video_segments_serialization_example.dart';
import 'package:catalog/examples/editor/saveState/video_serialization_example.dart';
import 'package:catalog/examples/editor/saveVideo/save_video_base64_example.dart';
import 'package:catalog/examples/editor/saveVideo/save_video_camera_example.dart';
import 'package:catalog/examples/editor/saveVideo/save_video_local_example.dart';
import 'package:catalog/examples/editor/saveVideo/save_video_remote_example.dart';
import 'package:catalog/examples/editor/snapping/photo_snapping_configuration_example.dart';
import 'package:catalog/examples/editor/snapping/video_snapping_configuration_example.dart';
import 'package:catalog/examples/filters/addFilters/local/photo_filter_local_example.dart';
import 'package:catalog/examples/filters/addFilters/local/video_filter_local_example.dart';
import 'package:catalog/examples/filters/addFilters/remote/photo_filter_remote_example.dart';
import 'package:catalog/examples/filters/addFilters/remote/video_filter_remote_example.dart';
import 'package:catalog/examples/filters/configuration/photo_filter_configuration_example.dart';
import 'package:catalog/examples/filters/configuration/video_filter_configuration_example.dart';
import 'package:catalog/examples/focus/photo_focus_configuration_example.dart';
import 'package:catalog/examples/focus/video_focus_configuration_example.dart';
import 'package:catalog/examples/frames/addFrames/local/photo_frames_local_example.dart';
import 'package:catalog/examples/frames/addFrames/local/video_frames_local_example.dart';
import 'package:catalog/examples/frames/addFrames/remote/photo_frames_remote_example.dart';
import 'package:catalog/examples/frames/addFrames/remote/video_frames_remote_example.dart';
import 'package:catalog/examples/frames/configuration/photo_frames_configuration_example.dart';
import 'package:catalog/examples/frames/configuration/video_frames_configuration_example.dart';
import 'package:catalog/examples/gettingStarted/show_photo_editor_example.dart';
import 'package:catalog/examples/gettingStarted/show_video_editor_example.dart';
import 'package:catalog/examples/overlays/addOverlays/local/photo_overlay_local_example.dart';
import 'package:catalog/examples/overlays/addOverlays/local/video_overlay_local_example.dart';
import 'package:catalog/examples/overlays/addOverlays/remote/photo_overlay_remote_example.dart';
import 'package:catalog/examples/overlays/addOverlays/remote/video_overlay_remote_example.dart';
import 'package:catalog/examples/overlays/configuration/photo_overlay_configuration_example.dart';
import 'package:catalog/examples/overlays/configuration/video_overlay_configuration_example.dart';
import 'package:catalog/examples/solutions/annotation/photo_annotation_example.dart';
import 'package:catalog/examples/solutions/annotation/video_annotation_example.dart';
import 'package:catalog/examples/sticker/addSticker/local/photo_sticker_local_example.dart';
import 'package:catalog/examples/sticker/addSticker/local/video_sticker_local_example.dart';
import 'package:catalog/examples/sticker/addSticker/remote/photo_sticker_remote_example.dart';
import 'package:catalog/examples/sticker/addSticker/remote/video_sticker_remote_example.dart';
import 'package:catalog/examples/sticker/configuration/photo_sticker_configuration_example.dart';
import 'package:catalog/examples/sticker/configuration/video_sticker_configuration_example.dart';
import 'package:catalog/examples/text/addFonts/local/photo_text_local_example.dart';
import 'package:catalog/examples/text/addFonts/local/video_text_local_example.dart';
import 'package:catalog/examples/text/addFonts/remote/photo_text_remote_example.dart';
import 'package:catalog/examples/text/addFonts/remote/video_text_remote_example.dart';
import 'package:catalog/examples/text/configuration/photo_text_configuration_example.dart';
import 'package:catalog/examples/text/configuration/video_text_configuration_example.dart';
import 'package:catalog/examples/textDesign/configuration/photo_text_design_configuration_example.dart';
import 'package:catalog/examples/textDesign/configuration/video_text_design_configuration_example.dart';
import 'package:catalog/examples/transform/photo_transform_configuration_example.dart';
import 'package:catalog/examples/transform/video_transform_configuration_example.dart';
import 'package:catalog/examples/trim/enforceDuration/video_force_trim_example.dart';
import 'package:catalog/examples/trim/video_trim_configuration_example.dart';
import 'package:catalog/examples/userInterface/singleTool/photo_single_tool_example.dart';
import 'package:catalog/examples/userInterface/singleTool/video_single_tool_example.dart';
import 'package:catalog/examples/videoComposition/video_composition_configuration_example.dart';
import 'package:catalog/models/example.dart';
import 'package:catalog/models/section.dart';

final examplesPESDK = [
  Section("Getting Started", [
    Example("Show Editor", "Presents the photo editor modally.",
        ShowPhotoEditorExample()),
  ]),
  Section("Opening Assets", [
    Example(
        "From Camera Roll",
        "Loads a photo from camera roll and presents the photo editor.",
        OpenPhotoCameraRollExample()),
    Example(
        "From Local Path",
        "Loads a photo from a local path and presents the photo editor.",
        OpenPhotoLocalPathExample()),
    Example(
        "From Remote URL",
        "Loads a photo from an remote URL and presents the photo editor.",
        OpenPhotoRemoteURLExample()),
  ]),
  Section("Saving Assets", [
    Example(
        "To Camera Roll",
        "Presents the photo editor and saves the exported photo to the camera roll.",
        SavePhotoCameraRollExample()),
    Example(
        "To Filesystem",
        "Presents the photo editor and saves the exported photo to the filesystem.",
        SavePhotoLocalExample()),
    Example(
        "To Remote URL",
        "Presents the photo editor and saves the exported photo to a remote URL.",
        SavePhotoRemoteExample()),
    Example(
        "To Base64",
        "Presents the photo editor and saves the exported photo to a Base64 encoded string.",
        SavePhotoBase64Example())
  ]),
  Section("Saving State", [
    Example(
        "Serialization",
        "Presents a photo editor, serializes all edits and prints the output to the debugging console.",
        PhotoSerializationExample())
  ]),
  Section("Restoring State", [
    Example(
        "Deserialization",
        "Loads a serialized JSON file from the app bundle and presents a photo editor with state restored.",
        PhotoDeserializationExample())
  ]),
  Section("Editor Configuration", [
    Example(
        "Custom Snapping",
        "Presents a photo editor modally using a custom snapping configuration.",
        PhotoSnappingConfigurationExample()),
    Example(
        "Single Tool",
        "Presents a photo editor modally using the single tool mode.",
        PhotoSingleToolExample())
  ]),
  Section("Transform Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom transform tool configuration.",
        PhotoTransformConfigurationExample())
  ]),
  Section("Filter Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom filter tool configuration.",
        PhotoFilterConfigurationExample()),
    Example(
        "Add filter from local path",
        "Loads filters from the app bundle and presents a photo editor modally.",
        PhotoFilterLocalExample()),
    Example(
        "Add filter from remote URL",
        "Loads filters from a remote URL and presents a photo editor modally.",
        PhotoFilterRemoteExample()),
  ]),
  Section("Adjustment Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom adjustment tool configuration.",
        PhotoAdjustmentsConfigurationExample())
  ]),
  Section("Focus Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom focus tool configuration.",
        PhotoFocusConfigurationExample())
  ]),
  Section("Sticker Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom sticker tool configuration.",
        PhotoStickerConfigurationExample()),
    Example(
        "Add sticker from app bundle",
        "Loads stickers from the app bundle and presents a photo editor modally.",
        PhotoStickerLocalExample()),
    Example(
        "Add sticker from remote URL",
        "Loads stickers from a remote URL and presents a photo editor modally.",
        PhotoStickerRemoteExample()),
  ]),
  Section("Text Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom text tool configuration.",
        PhotoTextConfigurationExample()),
    Example(
        "Add font from app bundle",
        "Loads fonts from the app bundle and presents a photo editor modally.",
        PhotoTextLocalExample()),
    Example(
        "Add font from remote URL",
        "Loads fonts from a remote URL and presents a photo editor modally.",
        PhotoTextRemoteExample()),
  ]),
  Section("Text Design Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom text design tool configuration.",
        PhotoTextDesignConfigurationExample()),
  ]),
  Section("Overlay Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom overlay tool configuration.",
        PhotoOverlayConfigurationExample()),
    Example(
        "Add overlay from app bundle",
        "Loads overlays from the app bundle and presents a photo editor modally.",
        PhotoOverlayLocalExample()),
    Example(
        "Add overlay from remote URL",
        "Loads overlays from a remote URL and presents a photo editor modally.",
        PhotoOverlayRemoteExample()),
  ]),
  Section("Frame Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom frame tool configuration.",
        PhotoFramesConfigurationExample()),
    Example(
        "Add frame from app bundle",
        "Loads frames from the app bundle and presents a video editor modally.",
        PhotoFramesLocalExample()),
    Example(
        "Add frame from remote URL",
        "Loads frames from a remote URL and presents a video editor modally.",
        PhotoFramesRemoteExample()),
  ]),
  Section("Brush Configuration", [
    Example(
        "Custom Configuration",
        "Presents a photo editor modally using a custom brush tool configuration.",
        PhotoBrushConfigurationExample())
  ]),
  Section("Solutions Configuration", [
    Example(
        "Annotation",
        "Presents a video editor modally that's configured to work for an annotation use case.",
        PhotoAnnotationExample())
  ]),
];

final examplesVESDK = [
  Section("Getting Started", [
    Example("Show Editor", "Presents the video editor modally.",
        ShowVideoEditorExample()),
  ]),
  Section("Opening Assets", [
    Example(
        "From Camera Roll",
        "Loads a video from camera roll and presents the video editor.",
        OpenVideoCameraRollExample()),
    Example(
        "From Local Path",
        "Loads a video from a local path and presents the video editor.",
        OpenVideoLocalPathExample()),
    Example(
        "From Remote URL",
        "Loads a video from an remote URL and presents the video editor.",
        OpenVideoRemoteURLExample()),
    Example(
        "From Multiple Videos",
        "Loads a video from an remote URL and presents the video editor.",
        OpenVideoCompositionExample()),
  ]),
  Section("Saving Assets", [
    Example(
        "To Camera Roll",
        "Presents the video editor and saves the exported video to the camera roll.",
        SaveVideoCameraRollExample()),
    Example(
        "To Filesystem",
        "Presents the video editor and saves the exported video to the filesystem.",
        SaveVideoLocalExample()),
    Example(
        "To Remote URL",
        "Presents the video editor and saves the exported video to a remote URL.",
        SaveVideoRemoteExample()),
    Example(
        "To Base64",
        "Presents the video editor and saves the exported video to a Base64 encoded string.",
        SaveVideoBase64Example())
  ]),
  Section("Saving State", [
    Example(
        "Serialization",
        "Presents a video editor, serializes all edits and prints the output to the debugging console.",
        VideoSerializationExample()),
    Example(
        "Serialization Video Segments",
        "Presents a video editor, serializes all edits including the video segments and prints the output to the debugging console.",
        VideoSegmentsSerializationExample())
  ]),
  Section("Restoring State", [
    Example(
        "Deserialization",
        "Loads a serialized JSON file from the app bundle and presents a video editor with state restored.",
        VideoDeserializationExample()),
    Example(
        "Deserialization Video Segments",
        "Loads serialized video segments and presents a video editor with state restored.",
        VideoSegmentsDeserializationExample())
  ]),
  Section("Editor Configuration", [
    Example(
        "Custom Snapping",
        "Presents a video editor modally using a custom snapping configuration.",
        VideoSnappingConfigurationExample()),
    Example(
        "Single Tool",
        "Presents a video editor modally using the single tool mode.",
        VideoSingleToolExample())
  ]),
  Section("Video Composition Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom composition tool configuration.",
        VideoCompositionConfigurationExample())
  ]),
  Section("Trim Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom trim tool configuration.",
        VideoTrimConfigurationExample()),
    Example(
        "Enforce video duration",
        "Presents a video editor modally using a custom trim tool configuration to enforce a minimum and maximum video length.",
        VideoForceTrimExample())
  ]),
  Section("Audio Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom audio overlay tool configuration.",
        VideoAudioConfigurationExample()),
    Example(
        "Add audio overlay from local path",
        "Loads audio overlays from the app bundle and presents a video editor modally.",
        VideoAudioLocalExample()),
    Example(
        "Add audio overlay from remote URL",
        "Loads audio overlays from a remote URL and presents a video editor modally.",
        VideoAudioRemoteExample()),
  ]),
  Section("Transform Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom transform tool configuration.",
        VideoTransformConfigurationExample())
  ]),
  Section("Filter Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom filter tool configuration.",
        VideoFilterConfigurationExample()),
    Example(
        "Add filter from local path",
        "Loads filters from the app bundle and presents a video editor modally.",
        VideoFilterLocalExample()),
    Example(
        "Add filter from remote URL",
        "Loads filters from a remote URL and presents a video editor modally.",
        VideoFilterRemoteExample()),
  ]),
  Section("Adjustment Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom adjustment tool configuration.",
        VideoAdjustmentsConfigurationExample())
  ]),
  Section("Focus Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom focus tool configuration.",
        VideoFocusConfigurationExample())
  ]),
  Section("Sticker Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom sticker tool configuration.",
        VideoStickerConfigurationExample()),
    Example(
        "Add sticker from app bundle",
        "Loads stickers from the app bundle and presents a video editor modally.",
        VideoStickerLocalExample()),
    Example(
        "Add sticker from remote URL",
        "Loads stickers from a remote URL and presents a video editor modally.",
        VideoStickerRemoteExample()),
  ]),
  Section("Text Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom text tool configuration.",
        VideoTextConfigurationExample()),
    Example(
        "Add font from app bundle",
        "Loads fonts from the app bundle and presents a video editor modally.",
        VideoTextLocalExample()),
    Example(
        "Add font from remote URL",
        "Loads fonts from a remote URL and presents a video editor modally.",
        VideoTextRemoteExample()),
  ]),
  Section("Text Design Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom text design tool configuration.",
        VideoTextDesignConfigurationExample()),
  ]),
  Section("Overlay Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom overlay tool configuration.",
        VideoOverlayConfigurationExample()),
    Example(
        "Add overlay from app bundle",
        "Loads overlays from the app bundle and presents a video editor modally.",
        VideoOverlayLocalExample()),
    Example(
        "Add overlay from remote URL",
        "Loads overlays from a remote URL and presents a video editor modally.",
        VideoOverlayRemoteExample()),
  ]),
  Section("Frame Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom frame tool configuration.",
        VideoFramesConfigurationExample()),
    Example(
        "Add frame from app bundle",
        "Loads frames from the app bundle and presents a video editor modally.",
        VideoFramesLocalExample()),
    Example(
        "Add frame from remote URL",
        "Loads frames from a remote URL and presents a video editor modally.",
        VideoFramesRemoteExample()),
  ]),
  Section("Brush Configuration", [
    Example(
        "Custom Configuration",
        "Presents a video editor modally using a custom brush tool configuration.",
        VideoBrushConfigurationExample())
  ]),
  Section("Solutions Configuration", [
    Example(
        "Annotation",
        "Presents a video editor modally that's configured to work for an annotation use case.",
        VideoAnnotationExample())
  ]),
];

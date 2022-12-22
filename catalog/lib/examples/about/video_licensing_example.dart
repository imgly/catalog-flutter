import 'package:catalog/models/code_example.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoLicensingExample extends CodeExample {
  @override
  void invoke() {
    // <code-example-vesdk-license>
    VESDK.unlockWithLicense("assets/license");
    // <code-example-vesdk-license>
  }
}

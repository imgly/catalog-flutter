import 'package:catalog/models/code_example.dart';
import 'package:video_editor_sdk/video_editor_sdk.dart';

class VideoLicensingExample extends CodeExample {
  @override
  void invoke() async {
    // <code-example-vesdk-license>
    try {
      await VESDK.unlockWithLicense("assets/vesdk_license");
    } catch (error) {
      print("Failed to unlock VE.SDK with: $error.");
    }
    // <code-example-vesdk-license>
  }
}

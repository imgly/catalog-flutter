import 'package:catalog/models/code_example.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoLicensingExample extends CodeExample {
  @override
  void invoke() async {
    // <code-example-pesdk-license>
    try {
      await PESDK.unlockWithLicense("assets/pesdk_license");
    } catch (error) {
      print("Failed to unlock PE.SDK with: $error.");
    }
    // <code-example-pesdk-license>
  }
}

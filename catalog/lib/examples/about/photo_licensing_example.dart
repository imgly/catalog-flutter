import 'package:catalog/models/code_example.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoLicensingExample extends CodeExample {
  @override
  void invoke() {
    // <code-example-pesdk-license>
    PESDK.unlockWithLicense("assets/pesdk_license");
    // <code-example-pesdk-license>
  }
}

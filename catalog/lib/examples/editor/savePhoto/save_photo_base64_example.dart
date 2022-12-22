import 'dart:convert';
import 'dart:io';

import 'package:catalog/models/code_example.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class SavePhotoBase64Example extends CodeExample {
  @override
  void invoke() async {
    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(image: "assets/LA.jpg");

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        // For this example, the photo is encoded in Base64.
        // highlight-result
        final bytes = await File(Uri.parse(result.image).path).readAsBytes();
        final base64EncodedString = base64Encode(bytes);
        print(
            "Received Base64 encoded string with ${base64EncodedString.length} characters.");
        // highlight-result
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

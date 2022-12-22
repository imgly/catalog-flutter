import 'dart:io';

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class SavePhotoLocalExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // highlight-configuration
      final outputDirectory = await getTemporaryDirectory();
      final filepath =
          "${outputDirectory.uri}export${Platform.isAndroid ? ".png" : ""}";
      final configuration =
          Configuration(export: ExportOptions(filename: filepath));
      // highlight-configuration

      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
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

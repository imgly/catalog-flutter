import 'dart:convert';

import 'package:catalog/models/code_example.dart';
import 'package:flutter/services.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoDeserializationExample extends CodeExample {
  @override
  void invoke() async {
    try {
      // highlight-serialization
      // Load a serialization from the assets folder.
      final serializationString =
          await rootBundle.loadString("assets/photo_serialization.json");
      final serialization = jsonDecode(serializationString);
      // highlight-serialization

      // Open the photo editor and handle the export as well as any occurring errors.
      // highlight-open-editor
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", serialization: serialization);
      // highlight-open-editor

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`.
        print(result.image);
      } else {
        // The user tapped on the cancel button within the editor.
        return;
      }
    } catch (error) {
      // There was an error generating the image.
      print(error);
    }
  }
}

import 'package:catalog/models/code_example.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:photo_editor_sdk/photo_editor_sdk.dart';

class PhotoSerializationExample extends CodeExample {
  @override
  void invoke() async {
    // Create [SerializationOptions] to configure the serialization feature.
    // highlight-serialization
    final serializationOptions = SerializationOptions(
        // Enable the serialization feature.
        enabled: true,

        // For this example, the serialization should be returned
        // as an object to simply logging it in the console.
        exportType: SerializationExportType.object);

    // Create [ExportOptions] to apply the [serializationOptions].
    final exportOptions = ExportOptions(serialization: serializationOptions);

    // Create a [Configuration] instance.
    final configuration = Configuration(export: exportOptions);
    // highlight-serialization

    try {
      // Open the photo editor and handle the export as well as any occurring errors.
      final result = await PESDK.openEditor(
          image: "assets/LA.jpg", configuration: configuration);

      if (result != null) {
        // The user exported a new photo successfully and the newly generated photo is located at `result.image`
        // and the serialization is located at `result.serialization`.
        // highlight-usage
        print(result.serialization);
        // highlight-usage
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

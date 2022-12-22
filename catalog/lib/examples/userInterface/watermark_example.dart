import 'package:imgly_sdk/imgly_sdk.dart';

void example() {
  // <code-example>
  // Create [WatermarkOptions] to configure the watermark.
  final watermarkOptions = WatermarkOptions("assets/watermark.png",
      alignment: AlignmentMode.bottomLeft, size: 0.2, inset: 0.05);

  // Enable force export so that the watermark is always
  // applied.
  final exportOptions = ExportOptions(forceExport: true);

  // Create a [Configuration] instance.
  final configuration =
      Configuration(watermark: watermarkOptions, export: exportOptions);
  // <code-example>
}

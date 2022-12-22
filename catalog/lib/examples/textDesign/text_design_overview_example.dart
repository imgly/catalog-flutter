import 'package:imgly_sdk/imgly_sdk.dart';

void demo() {
  // example-items
  final textDesignOptions = TextDesignOptions(items: [
    TextDesign.existing("imgly_text_design_blocks"),
    TextDesign.existing("imgly_text_design_rotated"),
    TextDesign.existing("imgly_text_design_blocks_light"),
    TextDesign.existing("imgly_text_design_equal_width"),
    TextDesign.existing("imgly_text_design_masked"),
    TextDesign.existing("imgly_text_design_celebrate"),
    TextDesign.existing("imgly_text_design_sunshine"),
    TextDesign.existing("imgly_text_design_masked_badge"),
    TextDesign.existing("imgly_text_design_blocks_condensed"),
    TextDesign.existing("imgly_text_design_celebrate_simple"),
    TextDesign.existing("imgly_text_design_equal_width_fat"),
    TextDesign.existing("imgly_text_design_watercolor"),
    TextDesign.existing("imgly_text_design_particles"),
    TextDesign.existing("imgly_text_design_masked_speech_bubble"),
    TextDesign.existing("imgly_text_design_masked_speech_bubble_comic"),
    TextDesign.existing("imgly_text_design_multiline"),
  ]);
  final configuration = Configuration(textdesign: textDesignOptions);
  // example-items
}

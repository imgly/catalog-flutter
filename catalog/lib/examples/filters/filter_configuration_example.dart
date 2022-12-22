import 'package:imgly_sdk/imgly_sdk.dart';

void categoriesDemo() {
  // <code-example-categories>
  final filterCategory = FilterCategory("custom_filter_group", "Custom",
      thumbnailUri: "assets/custom_filter_category.jpg",
      items: [
        LutFilter("custom_filter", "Custom", "assets/custom_lut_invert.png")
      ]);
  final filterOptions = FilterOptions(categories: [filterCategory]);
  final configuration = Configuration(filter: filterOptions);
  // <code-example-categories>
}

void flattenDemo() {
  // <code-example-flatten>
  final filterOptions = FilterOptions(flattenCategories: true);
  final configuration = Configuration(filter: filterOptions);
  // <code-example-flatten>
}

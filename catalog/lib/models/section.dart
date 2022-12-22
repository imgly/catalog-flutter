import 'example.dart';

/// A section.
class Section {
  /// Create a new instance with the given [title] and [items].
  Section(this.title, this.items);

  /// The [title] of the section.
  final String title;

  /// The [Example]s contained in this section.
  final List<Example> items;
}

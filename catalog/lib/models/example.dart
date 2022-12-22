import 'package:catalog/models/code_example.dart';

/// An example.
class Example {
  /// Create a new instance with the given [title], [description]
  /// and code [example].
  Example(this.title, this.description, this.example);

  /// The [title] of the example.
  final String title;

  /// The [description] of the example.
  final String description;

  /// The [CodeExample] that contains the invokable code.
  final CodeExample example;
}

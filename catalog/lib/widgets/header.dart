import 'package:flutter/material.dart';

/// A [Header] is used to display the title of a section.
class Header extends StatelessWidget {
  /// Create a new instance with the given [title] and key.
  const Header(this.title, {super.key});

  /// The [title] of the header.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }
}

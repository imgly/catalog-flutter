import 'package:flutter/material.dart';

class ExampleItem extends StatelessWidget {
  const ExampleItem(this.title, this.description, this.onTap, {super.key});

  /// The title of the example.
  final String title;

  /// The description of the example.
  final String description;

  /// The action when the item is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(description)
          ]),
        ));
  }
}

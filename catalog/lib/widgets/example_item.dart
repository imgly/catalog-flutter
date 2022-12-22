import 'package:catalog/models/example.dart';
import 'package:flutter/material.dart';

/// An [ExampleItem] is used to display an [Example].
class ExampleItem extends StatelessWidget {
  /// Create a new instance with the given [example] and [key].
  const ExampleItem(this.example, {super.key});

  /// The represented [Example].
  final Example example;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: example.example.invoke,
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              example.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(example.description)
          ]),
        ));
  }
}

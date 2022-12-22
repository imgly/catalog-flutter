import 'package:catalog/bloc/interaction_bloc.dart';
import 'package:catalog/bloc/product_bloc.dart';
import 'package:catalog/data/examples.dart';
import 'package:catalog/models/product.dart';
import 'package:catalog/widgets/example_item.dart';
import 'package:catalog/widgets/header.dart';
import 'package:catalog/widgets/product_selection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMG.LY for Flutter',
      home: MyHomePage(title: 'IMG.LY for Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  /// The [title] of the app bar.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(widget.title, style: const TextStyle(color: Colors.black)),
          backgroundColor: Colors.white12,
          shadowColor: Colors.transparent,
        ),
        body: StreamBuilder(
            stream: InteractionBloc.shared.interactionStream,
            initialData: false,
            builder: (context, snapshot) {
              return IgnorePointer(
                ignoring: snapshot.data ?? false,
                child: Column(
                  children: [
                    const ProductSelection(),
                    Expanded(
                      child: StreamBuilder(
                        stream: ProductBloc.shared.stream,
                        initialData: Product.vesdk,
                        builder: (context, snapshot) {
                          final examples = snapshot.data == Product.vesdk
                              ? examplesVESDK
                              : examplesPESDK;

                          return ListView.builder(
                            padding: const EdgeInsets.only(top: 5, bottom: 25),
                            itemBuilder: ((context, index) {
                              final item = examples[index];
                              return Column(
                                children: [
                                  Header(item.title),
                                  const SizedBox(height: 5),
                                  ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder: ((context, exampleIndex) {
                                      final example = item.items[exampleIndex];
                                      return ExampleItem(example);
                                    }),
                                    itemCount: item.items.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                  )
                                ],
                              );
                            }),
                            itemCount: examples.length,
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}

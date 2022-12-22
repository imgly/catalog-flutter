import 'package:catalog/bloc/product_bloc.dart';
import 'package:catalog/models/product.dart';
import 'package:flutter/material.dart';

/// The [ProductSelection] allows to switch between the
/// examples for PE.SDK and VE.SDK.
class ProductSelection extends StatelessWidget {
  /// Create a new instance with the given [key].
  const ProductSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ProductItem(Product.pesdk),
            SizedBox(width: 20),
            ProductItem(Product.vesdk),
          ],
        ));
  }
}

/// A [ProductItem] is contained inside a [ProductSelection]
/// and represents a certain product.
class ProductItem extends StatelessWidget {
  /// Create a new instance for the given [product] and
  /// a given [key].
  const ProductItem(this.product, {super.key});

  /// The [Product] that is represented by this instance.
  final Product product;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ProductBloc.shared.stream,
        initialData: Product.vesdk,
        builder: (context, snapshot) {
          final selected = snapshot.data == product;
          String identifier = product == Product.pesdk ? "pesdk" : "vesdk";
          if (selected) identifier = "${identifier}_active";

          return InkWell(
            onTap: () => ProductBloc.shared.update(product),
            child: SizedBox(
              height: 30,
              child: Image(image: AssetImage("assets/$identifier.png")),
            ),
          );
        });
  }
}

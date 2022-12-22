import 'dart:async';

import 'package:catalog/models/product.dart';

/// The [ProductBloc] manages which examples are currently
/// displayed.
class ProductBloc {
  /// The shared instance.
  static ProductBloc shared = ProductBloc();

  final StreamController<Product> _interactionStream =
      StreamController<Product>.broadcast();

  /// The [Stream] that broadcasts the current product state.
  Stream<Product> get stream => _interactionStream.stream;

  /// Updates to the given [product].
  void update(Product product) {
    _interactionStream.sink.add(product);
  }
}

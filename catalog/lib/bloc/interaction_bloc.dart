import 'dart:async';

/// A bloc that manages the user interaction state.
class InteractionBloc {
  /// The shared instance.
  static InteractionBloc shared = InteractionBloc();

  final StreamController<bool> _interactionStream =
      StreamController<bool>.broadcast();

  /// The [Stream] that broadcasts the current interaction state.
  Stream<bool> get interactionStream => _interactionStream.stream;

  /// Enables the user interaction.
  void enable() {
    _interactionStream.sink.add(false);
  }

  /// Disables the user interaction.
  void disable() {
    _interactionStream.sink.add(true);
  }
}

import 'package:imgly_sdk/imgly_sdk.dart';

// <code-example-background-removal>
final configuration = Configuration(mainCanvasActions: [
  MainCanvasAction.undo,
  MainCanvasAction.redo,
  MainCanvasAction.removeBackground,
]);
// <code-example-background-removal>

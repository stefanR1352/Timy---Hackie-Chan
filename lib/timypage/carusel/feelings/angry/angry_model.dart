import '/flutter_flow/flutter_flow_util.dart';
import 'angry_widget.dart' show AngryWidget;
import 'package:flutter/material.dart';

class AngryModel extends FlutterFlowModel<AngryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

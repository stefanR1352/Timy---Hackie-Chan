import '/flutter_flow/flutter_flow_util.dart';
import 'build_widget.dart' show BuildWidget;
import 'package:flutter/material.dart';

class BuildModel extends FlutterFlowModel<BuildWidget> {
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

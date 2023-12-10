import '/flutter_flow/flutter_flow_util.dart';
import 'care_taker_account_widget.dart' show CareTakerAccountWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class CareTakerAccountModel extends FlutterFlowModel<CareTakerAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Signature widget.
  SignatureController? signatureController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    signatureController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

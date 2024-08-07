import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/room_view/check_in_view/check_in_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'room_detail_view_widget.dart' show RoomDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RoomDetailViewModel extends FlutterFlowModel<RoomDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm2;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  CheckInDataStruct? checkInData;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

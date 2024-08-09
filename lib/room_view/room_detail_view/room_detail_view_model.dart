import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/room_view/check_in_view/check_in_view_widget.dart';
import '/room_view/guest_payment_history_view/guest_payment_history_view_widget.dart';
import '/room_view/guest_payment_view/guest_payment_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'room_detail_view_widget.dart' show RoomDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RoomDetailViewModel extends FlutterFlowModel<RoomDetailViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in RoomDetailView widget.
  GuestListRecord? guestResult;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm2;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  CheckInDataStruct? checkInData;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? isUpdate;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm4;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GuestListRecord? guestDocument;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}

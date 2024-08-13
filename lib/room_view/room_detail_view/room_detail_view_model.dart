import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/room_view/check_in_view/check_in_view_widget.dart';
import '/room_view/guest_detail_view/guest_detail_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'room_detail_view_widget.dart' show RoomDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RoomDetailViewModel extends FlutterFlowModel<RoomDetailViewWidget> {
  ///  Local state fields for this component.

  List<DateTime> markerDateList = [];
  void addToMarkerDateList(DateTime item) => markerDateList.add(item);
  void removeFromMarkerDateList(DateTime item) => markerDateList.remove(item);
  void removeAtIndexFromMarkerDateList(int index) =>
      markerDateList.removeAt(index);
  void insertAtIndexInMarkerDateList(int index, DateTime item) =>
      markerDateList.insert(index, item);
  void updateMarkerDateListAtIndex(int index, Function(DateTime) updateFn) =>
      markerDateList[index] = updateFn(markerDateList[index]);

  bool showBookingButton = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm2;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Custom Action - getGuestDocument] action in Calendar widget.
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

  /// Action blocks.
  Future initData(BuildContext context) async {
    List<DateTime>? markerList;

    markerList = await actions.getBookingDateList(
      widget!.roomDocument!.reference,
    );
    markerDateList = markerList!.toList().cast<DateTime>();
  }
}

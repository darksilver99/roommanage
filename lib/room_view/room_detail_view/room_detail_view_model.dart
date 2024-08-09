import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'room_detail_view_widget.dart' show RoomDetailViewWidget;
import 'package:flutter/gestures.dart';
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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getBookingDateList] action in RoomDetailView widget.
  List<DateTime>? markerList;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

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

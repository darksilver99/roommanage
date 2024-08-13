import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'total_day_free_view_widget.dart' show TotalDayFreeViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TotalDayFreeViewModel extends FlutterFlowModel<TotalDayFreeViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  int totalDay = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - totalDayFree] action in TotalDayFreeView widget.
  int? totalDayResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'total_day_free_view_model.dart';
export 'total_day_free_view_model.dart';

class TotalDayFreeViewWidget extends StatefulWidget {
  const TotalDayFreeViewWidget({
    super.key,
    required this.roomRef,
  });

  final DocumentReference? roomRef;

  @override
  State<TotalDayFreeViewWidget> createState() => _TotalDayFreeViewWidgetState();
}

class _TotalDayFreeViewWidgetState extends State<TotalDayFreeViewWidget> {
  late TotalDayFreeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalDayFreeViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.totalDayResult = await actions.totalDayFree(
        widget!.roomRef,
      );
      _model.totalDay = _model.totalDayResult!;
      _model.isLoading = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_model.isLoading,
      child: Builder(
        builder: (context) {
          if (_model.totalDay > 0) {
            return Text(
              '${_model.totalDay.toString()} วันที่ว่างเดือนนี้',
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Kanit',
                    letterSpacing: 0.0,
                  ),
            );
          } else {
            return Text(
              'ไม่มีห้องว่างแล้ว',
              maxLines: 2,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Kanit',
                    letterSpacing: 0.0,
                  ),
            );
          }
        },
      ),
    );
  }
}

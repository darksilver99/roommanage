import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_room_view_model.dart';
export 'no_room_view_model.dart';

class NoRoomViewWidget extends StatefulWidget {
  const NoRoomViewWidget({super.key});

  @override
  State<NoRoomViewWidget> createState() => _NoRoomViewWidgetState();
}

class _NoRoomViewWidgetState extends State<NoRoomViewWidget> {
  late NoRoomViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoRoomViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -0.2),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 42.0,
                ),
                Text(
                  'ยังไม่มีห้อง',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

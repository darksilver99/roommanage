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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'room_detail_view_model.dart';
export 'room_detail_view_model.dart';

class RoomDetailViewWidget extends StatefulWidget {
  const RoomDetailViewWidget({
    super.key,
    required this.roomDocument,
  });

  final RoomListRecord? roomDocument;

  @override
  State<RoomDetailViewWidget> createState() => _RoomDetailViewWidgetState();
}

class _RoomDetailViewWidgetState extends State<RoomDetailViewWidget> {
  late RoomDetailViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomDetailViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.0, 16.0, 8.0, 32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'ห้อง ${widget!.roomDocument?.subject}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: StreamBuilder<BuildingListRecord>(
                                stream: BuildingListRecord.getDocument(
                                    widget!.roomDocument!.buildingRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final rowBuildingListRecord = snapshot.data!;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${rowBuildingListRecord.subject} ชั้น ${widget!.roomDocument?.floorNumber?.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'สถานะ : ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            functions.getStatusText(
                                                widget!.roomDocument!.status,
                                                FFAppState()
                                                    .roomStatusList
                                                    .toList()),
                                            '-',
                                          ),
                                          style: TextStyle(
                                            color: () {
                                              if (widget!
                                                      .roomDocument?.status ==
                                                  0) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondary;
                                              } else if (widget!
                                                      .roomDocument?.status ==
                                                  1) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .error;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .warning;
                                              }
                                            }(),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rubik',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (widget!.roomDocument?.status != 1)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        if (widget!.roomDocument?.status == 3) {
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              _model.isConfirm2 =
                                                  await action_blocks
                                                      .confirmBlock(
                                                context,
                                                title: 'ต้องการเปิดห้องนี้?',
                                              );
                                              if (_model.isConfirm2!) {
                                                await widget!
                                                    .roomDocument!.reference
                                                    .update(
                                                        createRoomListRecordData(
                                                  status: 0,
                                                ));
                                                Navigator.pop(
                                                    context, 'update');
                                              }

                                              setState(() {});
                                            },
                                            text: 'เปิดห้องพัก',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        } else {
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (widget!.roomDocument
                                                                ?.status !=
                                                            0) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    InfoCustomViewWidget(
                                                                  title:
                                                                      'ยังมีผู้เข้าพักในห้องนี้ กรุณาเปลี่ยนสถานะเป็นห้องว่างก่อน',
                                                                  status:
                                                                      'warning',
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          _model.isConfirm =
                                                              await action_blocks
                                                                  .confirmBlock(
                                                            context,
                                                            title:
                                                                'ต้องการปิดปรับปรุงห้องนี้?',
                                                          );
                                                          if (_model
                                                              .isConfirm!) {
                                                            await widget!
                                                                .roomDocument!
                                                                .reference
                                                                .update(
                                                                    createRoomListRecordData(
                                                              status: 3,
                                                            ));
                                                            Navigator.pop(
                                                                context,
                                                                'update');
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text:
                                                          'ปิดปรับปรุงห้องพัก',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.isConfirm3 =
                                                            await action_blocks
                                                                .confirmBlock(
                                                          context,
                                                          title:
                                                              'ต้องการเช็คอินห้องนี้?',
                                                        );
                                                        if (_model
                                                            .isConfirm3!) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    CheckInViewWidget(
                                                                  roomDocument:
                                                                      widget!
                                                                          .roomDocument!,
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.checkInData =
                                                                      value));

                                                          if (_model.checkInData
                                                                  ?.isUpdate ==
                                                              'update') {
                                                            await widget!
                                                                .roomDocument!
                                                                .reference
                                                                .update(
                                                                    createRoomListRecordData(
                                                              status: 1,
                                                              endDate: _model
                                                                  .checkInData
                                                                  ?.endDate,
                                                              isDaily: _model
                                                                      .checkInData
                                                                      ?.endDate !=
                                                                  null,
                                                            ));
                                                            Navigator.pop(
                                                                context,
                                                                'update');
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: 'เช็คอินห้อง',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 8.0))
                    .addToEnd(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

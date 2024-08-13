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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.initData(context);
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
                                          fontFamily: 'Kanit',
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
                                  8.0, 0.0, 0.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final rowBuildingListRecord =
                                            snapshot.data!;

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${rowBuildingListRecord.subject} ชั้น ${widget!.roomDocument?.floorNumber?.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (widget!.roomDocument?.status == 0) {
                                        return Builder(
                                          builder: (context) => FFButtonWidget(
                                            onPressed: () async {
                                              _model.isConfirm =
                                                  await action_blocks
                                                      .confirmBlock(
                                                context,
                                                title:
                                                    'ต้องการปิดปรับปรุงห้องนี้?',
                                                detail:
                                                    'กรุณาตรวจสอบว่ามีผู้เข้าพักตกค้างอยู่หรือไม่',
                                              );
                                              if (_model.isConfirm!) {
                                                await widget!
                                                    .roomDocument!.reference
                                                    .update(
                                                        createRoomListRecordData(
                                                  status: 3,
                                                ));
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child:
                                                            InfoCustomViewWidget(
                                                          title:
                                                              'ปิดปรับปรุงห้องพักแล้ว',
                                                          status: 'success',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                Navigator.pop(
                                                    context, 'update');
                                              }

                                              setState(() {});
                                            },
                                            text: 'ปิดปรับปรุงห้อง',
                                            options: FFButtonOptions(
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            _model.isConfirm2 =
                                                await action_blocks
                                                    .confirmBlock(
                                              context,
                                              title:
                                                  'ต้องการเปิดใช้งานห้องพัก?',
                                            );
                                            if (_model.isConfirm2!) {
                                              await widget!
                                                  .roomDocument!.reference
                                                  .update(
                                                      createRoomListRecordData(
                                                status: 0,
                                              ));
                                              Navigator.pop(context, 'update');
                                            }

                                            setState(() {});
                                          },
                                          text: 'เปิดใช้งานห้อง',
                                          options: FFButtonOptions(
                                            height: 32.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Kanit',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
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
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            if (widget!.roomDocument?.status == 0)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Divider(
                                    thickness: 3.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: FlutterFlowCalendar(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        weekFormat: false,
                                        weekStartsMonday: false,
                                        rowHeight: 64.0,
                                        onChange: (DateTimeRange?
                                            newSelectedDate) async {
                                          if (_model.calendarSelectedDay ==
                                              newSelectedDate) {
                                            return;
                                          }
                                          _model.calendarSelectedDay =
                                              newSelectedDate;
                                          _model.guestDocument =
                                              await actions.getGuestDocument(
                                            _model.calendarSelectedDay!.start,
                                            widget!.roomDocument!.reference,
                                          );
                                          if (_model.guestDocument != null) {
                                            FFAppState()
                                                .tmpBookingDateSelected = null;
                                            setState(() {});
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child:
                                                        GuestDetailViewWidget(
                                                      roomDocument:
                                                          widget!.roomDocument!,
                                                      guestDocument:
                                                          _model.guestDocument!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            await _model.initData(context);
                                            setState(() {});
                                          } else {
                                            if (_model
                                                    .calendarSelectedDay!.end <
                                                getCurrentTimestamp) {
                                              FFAppState()
                                                      .tmpBookingDateSelected =
                                                  null;
                                              setState(() {});
                                            } else {
                                              FFAppState()
                                                      .tmpBookingDateSelected =
                                                  _model.calendarSelectedDay
                                                      ?.start;
                                              setState(() {});
                                            }
                                          }

                                          setState(() {});
                                        },
                                        titleStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Kanit',
                                              letterSpacing: 0.0,
                                            ),
                                        dayOfWeekStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  letterSpacing: 0.0,
                                                ),
                                        dateStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Kanit',
                                              letterSpacing: 0.0,
                                            ),
                                        selectedDateStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  letterSpacing: 0.0,
                                                ),
                                        inactiveDateStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  letterSpacing: 0.0,
                                                ),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().tmpBookingDateSelected !=
                                      null)
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          if (FFAppState()
                                                  .tmpBookingDateSelected !=
                                              null) {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: CheckInViewWidget(
                                                      roomDocument:
                                                          widget!.roomDocument!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            await _model.initData(context);
                                            setState(() {});
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: InfoCustomViewWidget(
                                                      title: 'กรุณาเลือกวันที่',
                                                      status: 'error',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                        text: 'เช็คอิน',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
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

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/no_room_view/no_room_view_widget.dart';
import '/component/total_day_free_view/total_day_free_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/more_view/select_building_and_floor_view/select_building_and_floor_view_widget.dart';
import '/room_view/room_detail_view/room_detail_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkAppVersion(context);
      await _model.checkCuurentDate(context);
      await _model.initData(context);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: Builder(
        builder: (context) => Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 86.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: WebViewAware(
                      child: SelectBuildingAndFloorViewWidget(
                        isCreate: true,
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            elevation: 8.0,
            label: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                Text(
                  'เพิ่มห้อง',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Kanit',
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          wrapWithModel(
            model: _model.backgroundViewModel,
            updateCallback: () => setState(() {}),
            child: BackgroundViewWidget(),
          ),
          if (!_model.isLoading)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (FFAppState()
                                              .currentDropdownSelected
                                              .buildingDoc !=
                                          null &&
                                      FFAppState()
                                              .currentDropdownSelected
                                              .buildingDoc !=
                                          '') {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        '${FFAppState().buildingList.where((e) => e.buildDoc == FFAppState().currentDropdownSelected.buildingDoc).toList().first.subject} ชั้น ${FFAppState().currentDropdownSelected.floorNumber} จำนวน ${_model.tmpRoomList.length.toString()} ห้อง',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Kanit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        '',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Kanit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              if (FFAppState()
                                          .currentDropdownSelected
                                          .buildingDoc !=
                                      null &&
                                  FFAppState()
                                          .currentDropdownSelected
                                          .buildingDoc !=
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        spacing: 4.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                          .checkboxValue1 ??=
                                                      FFAppState()
                                                          .statusSelectedList[0]
                                                          .isSelected,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.checkboxValue1 =
                                                            newValue!);
                                                    if (newValue!) {
                                                      FFAppState()
                                                          .updateStatusSelectedListAtIndex(
                                                        0,
                                                        (e) => e
                                                          ..isSelected = _model
                                                              .checkboxValue1,
                                                      );
                                                      await _model
                                                          .updateRoomListBlock(
                                                              context);
                                                      setState(() {});
                                                    } else {
                                                      FFAppState()
                                                          .updateStatusSelectedListAtIndex(
                                                        0,
                                                        (e) => e
                                                          ..isSelected = _model
                                                              .checkboxValue1,
                                                      );
                                                      await _model
                                                          .updateRoomListBlock(
                                                              context);
                                                      setState(() {});
                                                    }
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                'ว่าง(${_model.tmpRoomList.where((e) => e.status == 0).toList().length.toString()})',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                          .checkboxValue2 ??=
                                                      FFAppState()
                                                          .statusSelectedList[1]
                                                          .isSelected,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.checkboxValue2 =
                                                            newValue!);
                                                    if (newValue!) {
                                                      FFAppState()
                                                          .updateStatusSelectedListAtIndex(
                                                        1,
                                                        (e) => e
                                                          ..isSelected = _model
                                                              .checkboxValue2,
                                                      );
                                                      await _model
                                                          .updateRoomListBlock(
                                                              context);
                                                      setState(() {});
                                                    } else {
                                                      FFAppState()
                                                          .updateStatusSelectedListAtIndex(
                                                        1,
                                                        (e) => e
                                                          ..isSelected = _model
                                                              .checkboxValue2,
                                                      );
                                                      await _model
                                                          .updateRoomListBlock(
                                                              context);
                                                      setState(() {});
                                                    }
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                'ไม่ว่าง(${_model.tmpRoomList.where((e) => e.status == 1).toList().length.toString()})',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                          .checkboxValue3 ??=
                                                      FFAppState()
                                                          .statusSelectedList[2]
                                                          .isSelected,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.checkboxValue3 =
                                                            newValue!);
                                                    if (newValue!) {
                                                      FFAppState()
                                                          .updateStatusSelectedListAtIndex(
                                                        2,
                                                        (e) => e
                                                          ..isSelected = _model
                                                              .checkboxValue3,
                                                      );
                                                      await _model
                                                          .updateRoomListBlock(
                                                              context);
                                                      setState(() {});
                                                    } else {
                                                      FFAppState()
                                                          .updateStatusSelectedListAtIndex(
                                                        2,
                                                        (e) => e
                                                          ..isSelected = _model
                                                              .checkboxValue3,
                                                      );
                                                      await _model
                                                          .updateRoomListBlock(
                                                              context);
                                                      setState(() {});
                                                    }
                                                  },
                                                  side: BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                'ปรับปรุง(${_model.tmpRoomList.where((e) => e.status == 3).toList().length.toString()})',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: WebViewAware(
                                      child: SelectBuildingAndFloorViewWidget(
                                        isCreate: false,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) =>
                                  safeSetState(() => _model.isSearch = value));

                              if ((_model.isSearch != null &&
                                      _model.isSearch != '') &&
                                  (_model.isSearch == 'search')) {
                                await _model.resetSelectedBlock(context);
                                setState(() {
                                  _model.checkboxValue1 = true;
                                });
                                setState(() {
                                  _model.checkboxValue2 = true;
                                });
                                setState(() {
                                  _model.checkboxValue3 = true;
                                });
                                await _model.getRoomListBlock(
                                  context,
                                  buildingRef: FFAppState()
                                      .buildingList
                                      .where((e) =>
                                          e.buildDoc ==
                                          FFAppState()
                                              .currentDropdownSelected
                                              .buildingDoc)
                                      .toList()
                                      .first
                                      .buildingRef,
                                  floor: functions.stringToInt(FFAppState()
                                      .currentDropdownSelected
                                      .floorNumber),
                                );

                                setState(() {});
                              }

                              setState(() {});
                            },
                            text: 'เลือกอาคาร/ชั้น',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final roomListView = _model.roomList.toList();
                          if (roomListView.isEmpty) {
                            return NoRoomViewWidget();
                          }

                          return GridView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              128.0,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 0.8,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: roomListView.length,
                            itemBuilder: (context, roomListViewIndex) {
                              final roomListViewItem =
                                  roomListView[roomListViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await _model.checkExpireDate(context);
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: RoomDetailViewWidget(
                                            roomDocument: roomListViewItem,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.isUpdate = value));

                                  await _model.resetSelectedBlock(context);
                                  setState(() {
                                    _model.checkboxValue1 = true;
                                  });
                                  setState(() {
                                    _model.checkboxValue2 = true;
                                  });
                                  setState(() {
                                    _model.checkboxValue3 = true;
                                  });
                                  await _model.getRoomListBlock(
                                    context,
                                    buildingRef: FFAppState()
                                        .buildingList
                                        .where((e) =>
                                            e.buildDoc ==
                                            FFAppState()
                                                .currentDropdownSelected
                                                .buildingDoc)
                                        .toList()
                                        .first
                                        .buildingRef,
                                    floor: functions.stringToInt(FFAppState()
                                        .currentDropdownSelected
                                        .floorNumber),
                                  );

                                  setState(() {});

                                  setState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ห้อง ${roomListViewItem.subject}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (roomListViewItem.status ==
                                                    3)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.circle_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          size: 16.0,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          'ปิดปรับปรุง',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                TotalDayFreeViewWidget(
                                                              key: Key(
                                                                  'Keymra_${roomListViewIndex}_of_${roomListView.length}'),
                                                              roomRef:
                                                                  roomListViewItem
                                                                      .reference,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'ดูรายละเอียด',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
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
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

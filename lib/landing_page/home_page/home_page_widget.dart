import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/no_room_view/no_room_view_widget.dart';
import '/component/select_building_and_floor_view/select_building_and_floor_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/room_view/room_detail_view/room_detail_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      _model.customerResult = await queryCustomerNameRecordOnce(
        queryBuilder: (customerNameRecord) => customerNameRecord.where(
          'create_by',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.customerResult?.reference != null) {
        FFAppState().customerReference = _model.customerResult?.reference;
        _model.isHasCustomer = true;
        _model.buildingResult = await queryBuildingListRecordOnce(
          parent: _model.customerResult?.reference,
          queryBuilder: (buildingListRecord) => buildingListRecord
              .where(
                'status',
                isEqualTo: 1,
              )
              .orderBy('create_date'),
        );
        FFAppState().buildingList = [];
        while (_model.dataCount < _model.buildingResult!.length) {
          FFAppState().addToBuildingList(BuildingDataStruct(
            subject: _model.buildingResult?[_model.dataCount]?.subject,
            totalFloor: _model.buildingResult?[_model.dataCount]?.totalFloor,
            buildingRef: _model.buildingResult?[_model.dataCount]?.reference,
            buildDoc:
                'customer_name/${_model.buildingResult?[_model.dataCount]?.parentReference.id}/building_list/${_model.buildingResult?[_model.dataCount]?.reference.id}',
          ));
          setState(() {});
          _model.dataCount = _model.dataCount + 1;
        }
        if (FFAppState().currentDropdownSelected.buildingDoc != null &&
            FFAppState().currentDropdownSelected.buildingDoc != '') {
          await _model.getRoomListBlock(
            context,
            buildingRef: FFAppState()
                .buildingList
                .where((e) =>
                    e.buildDoc ==
                    FFAppState().currentDropdownSelected.buildingDoc)
                .toList()
                .first
                .buildingRef,
            floor: functions
                .stringToInt(FFAppState().currentDropdownSelected.floorNumber),
          );
        }
      } else {
        _model.isHasCustomer = false;

        context.pushNamed('CreateCustomerPage');
      }

      _model.isLoading = false;
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
      body: Stack(
        children: [
          wrapWithModel(
            model: _model.backgroundViewModel,
            updateCallback: () => setState(() {}),
            child: BackgroundViewWidget(),
          ),
          if (!_model.isLoading)
            Builder(
              builder: (context) {
                if (_model.isHasCustomer) {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              '${FFAppState().buildingList.where((e) => e.buildDoc == FFAppState().currentDropdownSelected.buildingDoc).toList().first.subject} ชั้น ${FFAppState().currentDropdownSelected.floorNumber} จำนวน ${_model.tmpRoomList.length.toString()} ห้อง',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Rubik',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              '',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Rubik',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                .statusSelectedList[
                                                                    0]
                                                                .isSelected,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .checkboxValue1 =
                                                              newValue!);
                                                          if (newValue!) {
                                                            FFAppState()
                                                                .updateStatusSelectedListAtIndex(
                                                              0,
                                                              (e) => e
                                                                ..isSelected =
                                                                    _model
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
                                                                ..isSelected =
                                                                    _model
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                .statusSelectedList[
                                                                    1]
                                                                .isSelected,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .checkboxValue2 =
                                                              newValue!);
                                                          if (newValue!) {
                                                            FFAppState()
                                                                .updateStatusSelectedListAtIndex(
                                                              1,
                                                              (e) => e
                                                                ..isSelected =
                                                                    _model
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
                                                                ..isSelected =
                                                                    _model
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                .statusSelectedList[
                                                                    2]
                                                                .isSelected,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .checkboxValue3 =
                                                              newValue!);
                                                          if (newValue!) {
                                                            FFAppState()
                                                                .updateStatusSelectedListAtIndex(
                                                              2,
                                                              (e) => e
                                                                ..isSelected =
                                                                    _model
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
                                                                ..isSelected =
                                                                    _model
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
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
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child:
                                              SelectBuildingAndFloorViewWidget(
                                            isCreate: false,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.isSearch = value));

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
                                        floor: functions.stringToInt(
                                            FFAppState()
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
                                          fontFamily: 'Rubik',
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 0.0),
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
                                    16.0,
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
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: RoomDetailViewWidget(
                                                roomDocument: roomListViewItem,
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.isUpdate = value));

                                        if ((_model.isUpdate != null &&
                                                _model.isUpdate != '') &&
                                            (_model.isUpdate == 'update')) {
                                          await _model
                                              .resetSelectedBlock(context);
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
                                            floor: functions.stringToInt(
                                                FFAppState()
                                                    .currentDropdownSelected
                                                    .floorNumber),
                                          );

                                          setState(() {});
                                        }

                                        setState(() {});
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'ห้อง ${roomListViewItem.subject}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
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
                                                              Icons
                                                                  .circle_rounded,
                                                              color: () {
                                                                if (roomListViewItem
                                                                        .status ==
                                                                    0) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary;
                                                                } else if (roomListViewItem
                                                                        .status ==
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
                                                              size: 12.0,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.getStatusText(
                                                                    roomListViewItem
                                                                        .status,
                                                                    FFAppState()
                                                                        .roomStatusList
                                                                        .toList()),
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Rubik',
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
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if (roomListViewItem
                                                                    .status ==
                                                                1)
                                                              Text(
                                                                'พักถึงวันที่ 12 พ.ค 2564',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'ดูรายละเอียด',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 32.0, 16.0, 32.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'คุณยังไม่ได้สร้างที่พัก',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('CreateCustomerPage');
                                      },
                                      text: 'สร้างที่พัก',
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidBuilding,
                                        size: 18.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: Colors.white,
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/no_room_view/no_room_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
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
        if (FFAppState().currentDropdownSelected != null) {
          _model.floorList = functions
              .setFloorList(FFAppState()
                  .buildingList
                  .where((e) =>
                      e.buildDoc ==
                      FFAppState().currentDropdownSelected.buildingDoc)
                  .toList()
                  .first
                  .totalFloor)
              .toList()
              .cast<String>();
          setState(() {});
          _model.roomResultList2 = await _model.getRoomListBlock(
            context,
            buildingRef: FFAppState()
                .buildingList
                .where((e) => e.buildDoc == _model.dropDownValue1)
                .toList()
                .first
                .buildingRef,
            floor: functions.stringToInt(_model.dropDownValue2!),
          );
          _model.roomList =
              _model.roomResultList2!.toList().cast<RoomListRecord>();
          setState(() {});
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
                                flex: 5,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController1 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue1 ??= FFAppState()
                                                  .currentDropdownSelected !=
                                              null
                                          ? FFAppState()
                                              .currentDropdownSelected
                                              .buildingDoc
                                          : null,
                                    ),
                                    options: List<String>.from(FFAppState()
                                        .buildingList
                                        .map((e) => e.buildDoc)
                                        .toList()),
                                    optionLabels: FFAppState()
                                        .buildingList
                                        .map((e) => e.subject)
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.dropDownValue1 = val);
                                      setState(() {
                                        _model.dropDownValueController2
                                            ?.reset();
                                      });
                                      _model.floorList = functions
                                          .setFloorList(FFAppState()
                                              .buildingList
                                              .where((e) =>
                                                  e.buildDoc ==
                                                  _model.dropDownValue1)
                                              .toList()
                                              .first
                                              .totalFloor)
                                          .toList()
                                          .cast<String>();
                                      setState(() {});
                                    },
                                    width: double.infinity,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'เลือกอาคาร',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController2 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue2 ??= FFAppState()
                                                  .currentDropdownSelected !=
                                              null
                                          ? FFAppState()
                                              .currentDropdownSelected
                                              .floorNumber
                                          : null,
                                    ),
                                    options: _model.floorList,
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.dropDownValue2 = val);
                                      if ((_model.dropDownValue1 != null &&
                                              _model.dropDownValue1 != '') &&
                                          (_model.dropDownValue2 != null &&
                                              _model.dropDownValue2 != '')) {
                                        FFAppState().currentDropdownSelected =
                                            CurrentDropdownSelectedDataStruct(
                                          buildingDoc: _model.dropDownValue1,
                                          floorNumber: _model.dropDownValue2,
                                        );
                                        _model.roomResultList =
                                            await _model.getRoomListBlock(
                                          context,
                                          buildingRef: FFAppState()
                                              .buildingList
                                              .where((e) =>
                                                  e.buildDoc ==
                                                  _model.dropDownValue1)
                                              .toList()
                                              .first
                                              .buildingRef,
                                          floor: functions.stringToInt(
                                              _model.dropDownValue2!),
                                        );
                                        _model.roomList = _model.roomResultList!
                                            .toList()
                                            .cast<RoomListRecord>();
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                    width: double.infinity,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'เลือกชั้น',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
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
                                    return Material(
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
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'ห้อง ${roomListViewItem.subject}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            'ไม่ว่าง',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      'พักถึงวันที่ 12 พ.ค 2564',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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

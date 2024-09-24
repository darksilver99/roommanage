import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/app_bar_view/app_bar_view_widget.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_floor_page_model.dart';
export 'create_floor_page_model.dart';

class CreateFloorPageWidget extends StatefulWidget {
  const CreateFloorPageWidget({super.key});

  @override
  State<CreateFloorPageWidget> createState() => _CreateFloorPageWidgetState();
}

class _CreateFloorPageWidgetState extends State<CreateFloorPageWidget> {
  late CreateFloorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateFloorPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
            updateCallback: () => safeSetState(() {}),
            child: BackgroundViewWidget(),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.appBarViewModel,
                updateCallback: () => safeSetState(() {}),
                child: AppBarViewWidget(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                                            'ระบุจำนวนชั้น',
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
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
                                  ),
                                  TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Kanit',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'จำนวนชั้น',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Kanit',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Kanit',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'สามารถเพิ่ม/แก้ไขได้อีกในภายหลัง',
                                            textAlign: TextAlign.end,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          if (FFAppState()
                                              .isCreateBuildingFromSetting) {
                                            await BuildingListRecord.createDoc(
                                                    FFAppState()
                                                        .customerData
                                                        .customerRef!)
                                                .set(
                                                    createBuildingListRecordData(
                                              createDate: getCurrentTimestamp,
                                              createBy: currentUserReference,
                                              status: 1,
                                              subject: FFAppState()
                                                  .tmpCustomerData
                                                  .buildingName,
                                              totalFloor: int.tryParse(
                                                  _model.textController.text),
                                            ));
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
                                                      title:
                                                          'สร้างข้อมูลที่พักสำเร็จแล้ว',
                                                      status: 'success',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            var customerNameRecordReference =
                                                CustomerNameRecord.collection
                                                    .doc();
                                            await customerNameRecordReference
                                                .set(
                                                    createCustomerNameRecordData(
                                              createDate: getCurrentTimestamp,
                                              createBy: currentUserReference,
                                              status: 1,
                                              customerName: FFAppState()
                                                  .tmpCustomerData
                                                  .customerName,
                                              expireDate:
                                                  functions.getEndDayTime(
                                                      functions.getNextDay(
                                                          FFAppState()
                                                              .configData
                                                              .freeDay)),
                                              isFirstTime: true,
                                            ));
                                            _model.insertCustomer = CustomerNameRecord
                                                .getDocumentFromData(
                                                    createCustomerNameRecordData(
                                                      createDate:
                                                          getCurrentTimestamp,
                                                      createBy:
                                                          currentUserReference,
                                                      status: 1,
                                                      customerName: FFAppState()
                                                          .tmpCustomerData
                                                          .customerName,
                                                      expireDate: functions
                                                          .getEndDayTime(functions
                                                              .getNextDay(
                                                                  FFAppState()
                                                                      .configData
                                                                      .freeDay)),
                                                      isFirstTime: true,
                                                    ),
                                                    customerNameRecordReference);
                                            FFAppState().customerData =
                                                CustomerDataStruct(
                                              customerName: _model
                                                  .insertCustomer?.customerName,
                                              expireDate: _model
                                                  .insertCustomer?.expireDate,
                                              customerRef: _model
                                                  .insertCustomer?.reference,
                                            );

                                            var buildingListRecordReference2 =
                                                BuildingListRecord.createDoc(
                                                    _model.insertCustomer!
                                                        .reference);
                                            await buildingListRecordReference2
                                                .set(
                                                    createBuildingListRecordData(
                                              createDate: getCurrentTimestamp,
                                              createBy: currentUserReference,
                                              status: 1,
                                              subject: FFAppState()
                                                  .tmpCustomerData
                                                  .buildingName,
                                              totalFloor: int.tryParse(
                                                  _model.textController.text),
                                            ));
                                            _model.insertBuilding = BuildingListRecord
                                                .getDocumentFromData(
                                                    createBuildingListRecordData(
                                                      createDate:
                                                          getCurrentTimestamp,
                                                      createBy:
                                                          currentUserReference,
                                                      status: 1,
                                                      subject: FFAppState()
                                                          .tmpCustomerData
                                                          .buildingName,
                                                      totalFloor: int.tryParse(
                                                          _model.textController
                                                              .text),
                                                    ),
                                                    buildingListRecordReference2);
                                            if ((currentUserEmail !=
                                                    'test@test.com') &&
                                                !FFAppState()
                                                    .configData
                                                    .isReview) {
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
                                                            'สร้างข้อมูลที่พักสำเร็จแล้ว',
                                                        status: 'success',
                                                        detail:
                                                            'พิเศษสำหรับสมาชิกใหม่ทดลองใช้งานฟรี ${FFAppState().configData.freeDay.toString()} วัน',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
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
                                                            'สร้างข้อมูลที่พักสำเร็จแล้ว',
                                                        status: 'success',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          }

                                          await actions.pushReplacement(
                                            context,
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'ต่อไป',
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidBuilding,
                                          size: 18.0,
                                        ),
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
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Kanit',
                                                    color: Colors.white,
                                                    fontSize: 22.0,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].addToStart(SizedBox(height: 64.0)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

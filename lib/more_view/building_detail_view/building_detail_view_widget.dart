import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/more_view/edit_building_and_total_floor_view/edit_building_and_total_floor_view_widget.dart';
import '/more_view/edit_room_view/edit_room_view_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'building_detail_view_model.dart';
export 'building_detail_view_model.dart';

class BuildingDetailViewWidget extends StatefulWidget {
  const BuildingDetailViewWidget({
    super.key,
    required this.title,
    required this.buildingDocument,
  });

  final String? title;
  final BuildingListRecord? buildingDocument;

  @override
  State<BuildingDetailViewWidget> createState() =>
      _BuildingDetailViewWidgetState();
}

class _BuildingDetailViewWidgetState extends State<BuildingDetailViewWidget>
    with TickerProviderStateMixin {
  late BuildingDetailViewModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuildingDetailViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.initBuidingData(
        context,
        documentRef: widget!.buildingDocument?.reference,
      );
      await _model.initFloorList(
        context,
        totalFloor: _model.buildingDocument?.totalFloor,
      );
      setState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-5.0, -5.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Visibility(
          visible: _model.buildingDocument?.createDate != null,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          _model.buildingDocument?.subject,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Kanit',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
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
                                  child: EditBuildingAndTotalFloorViewWidget(
                                    buildingDocument: _model.buildingDocument!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.isUpdate = value));

                          if (_model.isUpdate != null &&
                              _model.isUpdate != '') {
                            if (_model.isUpdate == 'update') {
                              await _model.initBuidingData(
                                context,
                                documentRef:
                                    widget!.buildingDocument?.reference,
                              );
                              await _model.initFloorList(
                                context,
                                totalFloor: _model.buildingDocument?.totalFloor,
                              );
                              setState(() {});
                            } else {
                              Navigator.pop(context);
                            }
                          }

                          setState(() {});
                        },
                        text: 'แก้ไขชื่อ/ชั้น',
                        icon: Icon(
                          Icons.edit_rounded,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 28.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).warning,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Kanit',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(null),
                        options: _model.floorList,
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          await _model.initRoom(
                            context,
                            buildingRef: _model.buildingDocument?.reference,
                          );
                          setState(() {});
                        },
                        width: 300.0,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Kanit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'เลือกชั้น',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
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
                  ],
                ),
              ),
              if (_model.roomList.isNotEmpty)
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final roomListView = _model.roomList.toList();
                      if (roomListView.isEmpty) {
                        return NoDataViewWidget();
                      }

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          16.0,
                          0,
                          32.0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: roomListView.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8.0),
                        itemBuilder: (context, roomListViewIndex) {
                          final roomListViewItem =
                              roomListView[roomListViewIndex];
                          return Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: EditRoomViewWidget(
                                            roomDocument: roomListViewItem,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.isUpdate2 = value));

                                  if ((_model.isUpdate2 != null &&
                                          _model.isUpdate2 != '') &&
                                      (_model.isUpdate2 == 'update')) {
                                    await _model.initRoom(
                                      context,
                                      buildingRef:
                                          _model.buildingDocument?.reference,
                                    );
                                    setState(() {});
                                  }

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
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              roomListViewItem.subject,
                                              maxLines: 2,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.edit_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                size: 24.0,
                                              ),
                                              Text(
                                                'แก้ไขห้อง',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
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
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/expire_alert_view/expire_alert_view_widget.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/component/no_room_view/no_room_view_widget.dart';
import '/component/total_day_free_view/total_day_free_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/more_view/promotion_view/promotion_view_widget.dart';
import '/more_view/select_building_and_floor_view/select_building_and_floor_view_widget.dart';
import '/room_view/room_detail_view/room_detail_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  bool isHasCustomer = false;

  bool isHasRoom = false;

  int dataCount = 0;

  List<RoomListRecord> roomList = [];
  void addToRoomList(RoomListRecord item) => roomList.add(item);
  void removeFromRoomList(RoomListRecord item) => roomList.remove(item);
  void removeAtIndexFromRoomList(int index) => roomList.removeAt(index);
  void insertAtIndexInRoomList(int index, RoomListRecord item) =>
      roomList.insert(index, item);
  void updateRoomListAtIndex(int index, Function(RoomListRecord) updateFn) =>
      roomList[index] = updateFn(roomList[index]);

  List<RoomListRecord> tmpRoomList = [];
  void addToTmpRoomList(RoomListRecord item) => tmpRoomList.add(item);
  void removeFromTmpRoomList(RoomListRecord item) => tmpRoomList.remove(item);
  void removeAtIndexFromTmpRoomList(int index) => tmpRoomList.removeAt(index);
  void insertAtIndexInTmpRoomList(int index, RoomListRecord item) =>
      tmpRoomList.insert(index, item);
  void updateTmpRoomListAtIndex(int index, Function(RoomListRecord) updateFn) =>
      tmpRoomList[index] = updateFn(tmpRoomList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? isSearch;
  // Stores action output result for [Action Block - checkExpireDate] action in Container widget.
  bool? isExpire;
  // Stores action output result for [Bottom Sheet - RoomDetailView] action in Container widget.
  String? isUpdate;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
  }

  /// Action blocks.
  Future getRoomListBlock(
    BuildContext context, {
    required DocumentReference? buildingRef,
    required int? floor,
  }) async {
    List<RoomListRecord>? roomListResult;

    roomListResult = await queryRoomListRecordOnce(
      parent: FFAppState().customerData.customerRef,
      queryBuilder: (roomListRecord) => roomListRecord
          .where(
            'floor_number',
            isEqualTo: floor,
          )
          .where(
            'building_ref',
            isEqualTo: buildingRef,
          )
          .orderBy('subject'),
    );
    roomList = roomListResult!.toList().cast<RoomListRecord>();
    tmpRoomList = roomListResult!.toList().cast<RoomListRecord>();
  }

  Future updateRoomListBlock(BuildContext context) async {
    List<RoomListRecord>? filterListResult;

    filterListResult = await actions.filterRoomList(
      tmpRoomList.toList(),
      FFAppState().statusSelectedList.toList(),
    );
    roomList = filterListResult!.toList().cast<RoomListRecord>();
  }

  Future resetSelectedBlock(BuildContext context) async {
    FFAppState().updateStatusSelectedListAtIndex(
      0,
      (e) => e..isSelected = true,
    );
    FFAppState().updateStatusSelectedListAtIndex(
      1,
      (e) => e..isSelected = true,
    );
    FFAppState().updateStatusSelectedListAtIndex(
      2,
      (e) => e..isSelected = true,
    );
  }

  Future initData(BuildContext context) async {
    CustomerNameRecord? customerResult;
    List<BuildingListRecord>? buildingResult;

    customerResult = await queryCustomerNameRecordOnce(
      queryBuilder: (customerNameRecord) => customerNameRecord.where(
        'create_by',
        isEqualTo: currentUserReference,
      ),
      singleRecord: true,
    ).then((s) => s.firstOrNull);
    if (customerResult?.reference != null) {
      FFAppState().customerData = CustomerDataStruct(
        customerName: customerResult?.customerName,
        expireDate: customerResult?.expireDate,
        customerRef: customerResult?.reference,
        isFirstTime: customerResult?.isFirstTime,
      );
      await checkExpireDate(context);
      isHasCustomer = true;
      buildingResult = await queryBuildingListRecordOnce(
        parent: customerResult?.reference,
        queryBuilder: (buildingListRecord) => buildingListRecord
            .where(
              'status',
              isEqualTo: 1,
            )
            .orderBy('create_date'),
      );
      FFAppState().buildingList = [];
      while (dataCount < buildingResult!.length) {
        FFAppState().addToBuildingList(BuildingDataStruct(
          subject: buildingResult?[dataCount]?.subject,
          totalFloor: buildingResult?[dataCount]?.totalFloor,
          buildingRef: buildingResult?[dataCount]?.reference,
          buildDoc:
              'customer_name/${buildingResult?[dataCount]?.parentReference.id}/building_list/${buildingResult?[dataCount]?.reference.id}',
        ));
        dataCount = dataCount + 1;
      }
      if (FFAppState().currentDropdownSelected.buildingDoc != null &&
          FFAppState().currentDropdownSelected.buildingDoc != '') {
        await getRoomListBlock(
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
      isHasCustomer = false;

      context.pushNamed('CreateCustomerPage');
    }

    isLoading = false;
  }

  Future checkCuurentDate(BuildContext context) async {
    if (functions.getStartDayTime(getCurrentTimestamp) !=
        functions.getStartDayTime(FFAppState().currentDate!)) {
      FFAppState().currentDate = functions.getStartDayTime(getCurrentTimestamp);
      FFAppState().isSkipOCRAlert = false;
      FFAppState().isSkipExpireAlert = false;
    }
  }

  Future<bool?> checkExpireDate(BuildContext context) async {
    String? isUpdate;

    if (getCurrentTimestamp > FFAppState().customerData.expireDate!) {
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
              child: PromotionViewWidget(),
            ),
          );
        },
      );

      return true;
    } else {
      if (getCurrentTimestamp >
          functions.getBeforeDay(5, FFAppState().customerData.expireDate!)) {
        if (!FFAppState().isSkipExpireAlert) {
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
                  child: ExpireAlertViewWidget(),
                ),
              );
            },
          ).then((value) => isUpdate = value);

          if ((isUpdate != null && isUpdate != '') && (isUpdate == 'update')) {
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
                    child: PromotionViewWidget(),
                  ),
                );
              },
            );
          }
        }
      }
      return false;
    }
  }

  Future checkIsFirstTime(BuildContext context) async {
    if (FFAppState().customerData.isFirstTime) {
      await FFAppState()
          .customerData
          .customerRef!
          .update(createCustomerNameRecordData(
            isFirstTime: false,
          ));
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
              child: InfoCustomViewWidget(
                title:
                    'เข้าใช้งานครั้งแรก พิเศษสำหรับคุณ ทดลองใช้งานฟรี ${FFAppState().configData.freeDay.toString()} วัน',
                status: 'warning',
              ),
            ),
          );
        },
      );
    }
  }
}

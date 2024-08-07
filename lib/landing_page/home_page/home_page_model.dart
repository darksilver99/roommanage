import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/no_room_view/no_room_view_widget.dart';
import '/component/select_building_and_floor_view/select_building_and_floor_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  CustomerNameRecord? customerResult;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<BuildingListRecord>? buildingResult;
  // Stores action output result for [Action Block - getRoomListBlock] action in HomePage widget.
  List<RoomListRecord>? roomResultList2;
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? isSearch;
  // Stores action output result for [Action Block - getRoomListBlock] action in Button widget.
  List<RoomListRecord>? roomResultList3;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
  }

  /// Action blocks.
  Future<List<RoomListRecord>?> getRoomListBlock(
    BuildContext context, {
    required DocumentReference? buildingRef,
    required int? floor,
  }) async {
    List<RoomListRecord>? roomList;

    roomList = await queryRoomListRecordOnce(
      parent: FFAppState().customerReference,
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
    return roomList;
  }
}

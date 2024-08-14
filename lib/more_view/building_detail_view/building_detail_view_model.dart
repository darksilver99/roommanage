import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'building_detail_view_widget.dart' show BuildingDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuildingDetailViewModel
    extends FlutterFlowModel<BuildingDetailViewWidget> {
  ///  Local state fields for this component.

  List<String> floorList = [];
  void addToFloorList(String item) => floorList.add(item);
  void removeFromFloorList(String item) => floorList.remove(item);
  void removeAtIndexFromFloorList(int index) => floorList.removeAt(index);
  void insertAtIndexInFloorList(int index, String item) =>
      floorList.insert(index, item);
  void updateFloorListAtIndex(int index, Function(String) updateFn) =>
      floorList[index] = updateFn(floorList[index]);

  List<RoomListRecord> roomList = [];
  void addToRoomList(RoomListRecord item) => roomList.add(item);
  void removeFromRoomList(RoomListRecord item) => roomList.remove(item);
  void removeAtIndexFromRoomList(int index) => roomList.removeAt(index);
  void insertAtIndexInRoomList(int index, RoomListRecord item) =>
      roomList.insert(index, item);
  void updateRoomListAtIndex(int index, Function(RoomListRecord) updateFn) =>
      roomList[index] = updateFn(roomList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<RoomListRecord>? roomListResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future initFloorList(BuildContext context) async {
    floorList = functions
        .floorToList(widget!.buildingDocument!.totalFloor)
        .toList()
        .cast<String>();
  }
}

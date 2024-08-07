// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<RoomListRecord>> filterRoomList(
  List<RoomListRecord> dataList,
  List<StatusSelectedDataStruct> selectedList,
) async {
  // Add your function code here!
  var selectedStatus = [];
  for (var i = 0; i < selectedList.length; i++) {
    if (selectedList[i].isSelected) {
      selectedStatus.add(selectedList[i].status);
    }
  }
  List<RoomListRecord> filterList = dataList.where((doc) {
    return selectedStatus.contains(doc.status);
  }).toList();
  return filterList;
}

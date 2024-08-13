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

Future<List<DateTime>> getBookingDateList(DocumentReference roomRef) async {
  // Add your function code here!
  List<DateTime> dateList = [];
  var rs = await roomRef
      .collection("guest_list")
      .where("status", isNotEqualTo: 3)
      .orderBy("start_date", descending: false)
      .get();
  for (var i = 0; i < rs.size; i++) {
    if (!rs.docs[i].data()["is_daily"]) {
      if (rs.docs[i].data()["end_date"] != null) {
        DateTime currentDate = rs.docs[i].data()["start_date"].toDate();
        while (!currentDate.isAfter(rs.docs[i].data()["end_date"].toDate())) {
          dateList.add(currentDate);
          currentDate = currentDate.add(Duration(days: 1));
        }
      } else {
        DateTime newDate = DateTime(
            rs.docs[i].data()["start_date"].toDate().year,
            rs.docs[i].data()["start_date"].toDate().month,
            rs.docs[i].data()["start_date"].toDate().day,
            1);
        dateList.add(newDate);
      }
    } else {
      DateTime currentDate = rs.docs[i].data()["start_date"].toDate();
      while (!currentDate.isAfter(rs.docs[i].data()["end_date"].toDate())) {
        dateList.add(currentDate);
        currentDate = currentDate.add(Duration(days: 1));
      }
    }
  }
  return dateList;
}

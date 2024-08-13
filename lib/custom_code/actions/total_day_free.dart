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

Future<int> totalDayFree(DocumentReference? roomRef) async {
  // Add your function code here!
  DateTime now = DateTime.now();
  DateTime firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
  DateTime lastDayOfMonth = firstDayOfNextMonth.subtract(Duration(days: 1));
  List<DateTime> datesInMonth = [];
  for (int i = now.day; i <= lastDayOfMonth.day; i++) {
    datesInMonth.add(DateTime(now.year, now.month, i));
  }

  List<DateTime> dateList = [];
  var rs = await roomRef!
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
        DateTime currentDate = rs.docs[i].data()["start_date"].toDate();
        while (!currentDate.isAfter(lastDayOfMonth)) {
          dateList.add(currentDate);
          currentDate = currentDate.add(Duration(days: 1));
        }
      }
    } else {
      DateTime currentDate = rs.docs[i].data()["start_date"].toDate();
      while (!currentDate.isAfter(rs.docs[i].data()["end_date"].toDate())) {
        dateList.add(currentDate);
        currentDate = currentDate.add(Duration(days: 1));
      }
    }
  }
  List<DateTime> difference =
      datesInMonth.where((date) => !dateList.contains(date)).toList();

  return difference.length;
}

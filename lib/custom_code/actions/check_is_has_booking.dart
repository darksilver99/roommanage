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

Future<bool> checkIsHasBooking(
  DocumentReference roomRef,
  DateTime? startDate,
  DateTime? endDate,
) async {
  // Add your function code here!
  // ถ้าสมัครรายเดือนมา ให้เช็คว่าหลังจากนั้นมัน คนจองมั้ยถ้ามีก็ไม่ได้เลย
  if (endDate == null) {
    var rs0 = await roomRef
        .collection("guest_list")
        .where("start_date", isGreaterThanOrEqualTo: startDate)
        .where("status", isEqualTo: 1)
        .get();
    if (rs0.size != 0) {
      print("มีคนพัก/จอง 0");
      return true;
    }
  }

  // หาแขกรายวันก่อน
  var rs = await roomRef
      .collection("guest_list")
      .where("start_date", isLessThanOrEqualTo: startDate)
      .where("end_date", isGreaterThanOrEqualTo: startDate)
      .where("status", isNotEqualTo: 3)
      .get();

  if (rs.size != 0) {
    print("มีคนพัก/จอง 1");
    return true;
  }

  // หาแขกรายวันก่อน
  if (endDate != null) {
    var rs2 = await roomRef
        .collection("guest_list")
        .where("start_date", isLessThanOrEqualTo: endDate)
        .where("end_date", isGreaterThanOrEqualTo: endDate)
        .where("status", isNotEqualTo: 3)
        .get();
    if (rs2.size != 0) {
      print("มีคนพัก/จอง 2");
      return true;
    }
  }

  // หาแขกรายเดือน
  var rs3 = await roomRef
      .collection("guest_list")
      .where("start_date", isLessThanOrEqualTo: startDate)
      .where("is_daily", isEqualTo: false)
      .where("status", isNotEqualTo: 3)
      .orderBy("start_date", descending: true)
      .get();
  if (rs3.size != 0) {
    if (rs3.docs[0].data()["status"] == 1) {
      print("มีคนพัก/จอง 3");
      return true;
    }
  }

  if (endDate != null) {
    var rs4 = await roomRef
        .collection("guest_list")
        .where("start_date", isLessThanOrEqualTo: endDate)
        .where("is_daily", isEqualTo: false)
        .where("status", isNotEqualTo: 3)
        .orderBy("start_date", descending: true)
        .get();
    if (rs4.size != 0) {
      if (rs4.docs[0].data()["status"] == 1) {
        print("มีคนพัก/จอง 4");
        return true;
      }
    }
  }

  return true;
}

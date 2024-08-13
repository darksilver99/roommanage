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

Future<GuestListRecord?> getGuestDocument(
  DateTime date,
  DocumentReference roomRef,
) async {
  // Add your function code here!
  // หาแขกรายวันก่อน
  var rs = await roomRef
      .collection("guest_list")
      .where("start_date", isLessThanOrEqualTo: date)
      .where("end_date", isGreaterThanOrEqualTo: date)
      .where("status", isNotEqualTo: 3)
      .get();

  if (rs.size != 0) {
    print(">>>aaa");
    GuestListRecord guestData =
        await GuestListRecord.getDocumentOnce(rs.docs[0].reference);
    return guestData;
  }

  // หาแขกรายเดือน
  var rs2 = await roomRef
      .collection("guest_list")
      .where("start_date", isLessThanOrEqualTo: date)
      .where("is_daily", isEqualTo: false)
      .where("status", isNotEqualTo: 3)
      .get();
  if (rs2.size != 0) {
    print(">>>bbb");
    if (rs2.docs[0].data()["status"] == 1) {
      GuestListRecord guestData =
          await GuestListRecord.getDocumentOnce(rs2.docs[0].reference);
      return guestData;
    }
  }

  return null;
}

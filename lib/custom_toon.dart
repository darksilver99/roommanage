import 'package:flutter/material.dart';
import 'package:room_manage/flutter_flow/custom_functions.dart';
import 'package:room_manage/flutter_flow/flutter_flow_util.dart';

import 'flutter_flow/flutter_flow_theme.dart';

buildMarker(DateTime day, List<DateTime>? dateList) {
  if (dateList == null) {
    return null;
  }
  bool containsDate = dateList.any((date) => date.year == day.year && date.month == day.month && date.day == day.day);
  if (containsDate) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 24),
            padding: const EdgeInsets.all(1),
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(shape: BoxShape.circle, color: FlutterFlowTheme.of(context).error),
            ),
          );
        });
  }

  List<DateTime> matchingDates = dateList.where((date) => date.hour == 1).toList();

  if (matchingDates.isNotEmpty) {
    if (day >= matchingDates[0]) {
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.all(1),
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(shape: BoxShape.circle, color: FlutterFlowTheme.of(context).error),
              ),
            );
          });
    }
  }

  return null;
}

updateTmpPaymentList() async {
  print("start");
  // เอาไว้อัพเดท ข้อมูลจ่ายมาไว้ข้างนอก (tmp_payment_room_list) เพื่อให้ดึงรายงานง่ายๆ น่าจะไม่ต้องใช้แล้ว
  /*var rsCustomer = await FirebaseFirestore.instance.collection("customer_name").get();
  for (var x = 0; x < rsCustomer.size; x++) {
    var rsRoom = await FirebaseFirestore.instance.collection("customer_name/${rsCustomer.docs[x].id}/room_list").get();
    for (var i = 0; i < rsRoom.size; i++) {
      var rsGuest = await FirebaseFirestore.instance.collection("customer_name/${rsCustomer.docs[x].id}/room_list/${rsRoom.docs[i].id}/guest_list").get();
      for (var j = 0; j < rsGuest.size; j++) {
        var rsPayment = await FirebaseFirestore.instance.collection("customer_name/${rsCustomer.docs[x].id}/room_list/${rsRoom.docs[i].id}/guest_list/${rsGuest.docs[j].id}/payment_room_list").get();
        for (var k = 0; k < rsPayment.size; k++) {
          Map<String, dynamic> paymentData = rsPayment.docs[k].data();

          paymentData['full_name'] = "${rsGuest.docs[j].data()["pre_name"]}${rsGuest.docs[j].data()["first_name"]} ${rsGuest.docs[j].data()["last_name"]}";
          paymentData['id_card_number'] = "${rsGuest.docs[j].data()["id_card_number"]}";
          paymentData['phone'] = "${rsGuest.docs[j].data()["phone"]}";
          paymentData['payment_room_ref'] = rsPayment.docs[k].reference;
          paymentData['room_subject'] = "${rsRoom.docs[i].data()["subject"]}";

          await FirebaseFirestore.instance.collection("customer_name/${rsCustomer.docs[x].id}/tmp_payment_room_list").doc().set(paymentData);
        }
      }
    }
  }*/
  print("success");
}

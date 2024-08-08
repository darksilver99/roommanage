import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> setFloorList(int totalFloor) {
  List<String> floorList = [];
  for (var i = 1; i <= totalFloor; i++) {
    floorList.add(i.toString());
  }
  return floorList;
}

int stringToInt(String str) {
  return int.parse(str);
}

String? getStatusText(
  int status,
  List<StatusDataStruct> statusList,
) {
  for (var dataStatus in statusList) {
    if (dataStatus.status == status) {
      return dataStatus.subject;
    }
  }
  return '-';
}

String? dateTh(DateTime? date) {
  if (date == null) {
    return null;
  }
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String getTimeDurationOnlyDay(
  DateTime dateIn,
  DateTime dateOut,
) {
  Duration duration = dateOut.difference(dateIn);
  int days = duration.inDays;
  StringBuffer result = StringBuffer();
  result.write('1 วัน ');
  if (days > 0) {
    result.write('$days วัน ');
  }
  return result.toString().trim();
}

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

String? getTimeDurationOnlyDay(
  DateTime dateIn,
  DateTime dateOut,
) {
  Duration duration = dateOut.difference(dateIn);
  int days = duration.inDays;
  int seconds = duration.inSeconds;
  StringBuffer result = StringBuffer();
  if (days <= 0) {
    if (seconds <= 0) {
      return null;
    }
    days = 1;
  }
  result.write('$days วัน');
  return result.toString().trim();
}

String dateTimeTh(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

DateTime getStartDayTime(DateTime currentDate) {
  DateTime startOfDay =
      DateTime(currentDate.year, currentDate.month, currentDate.day);
  return startOfDay;
}

DateTime getNextDay(int nextDay) {
  DateTime currentDate = DateTime.now();
  DateTime futureDate = currentDate.add(Duration(days: nextDay));
  return futureDate;
}

DateTime getEndDayTime(DateTime currentDate) {
  DateTime endOfDay = DateTime(
      currentDate.year, currentDate.month, currentDate.day, 23, 59, 59);
  return endOfDay;
}

DateTime getBeforeDay(
  int pastDay,
  DateTime date,
) {
  DateTime pastDate = date.subtract(Duration(days: pastDay));
  return pastDate;
}

List<String> floorToList(int totalFloor) {
  return List<String>.generate(totalFloor, (index) => (index + 1).toString());
}

String intToString(int val) {
  return val.toString();
}

DateTime getFirstDayOfMonth(DateTime date) {
  DateTime firstDayOfCurrentMonth = DateTime(date.year, date.month, 1);
  return firstDayOfCurrentMonth;
}

DateTime getLastDayOfMonth(DateTime date) {
  DateTime firstDayOfNextMonth = DateTime(date.year, date.month + 1, 1);
  DateTime lastDayOfCurrentMonth =
      firstDayOfNextMonth.subtract(Duration(seconds: 1));
  return lastDayOfCurrentMonth;
}

List<String> getYearFromCurrent(int len) {
  List<String> yearList = [];
  int currentYear = DateTime.now().year + 543;
  for (var i = currentYear - len; i <= currentYear; i++) {
    yearList.add(i.toString());
  }
  return yearList;
}

DateTime getDateByMonthAndYear(
  String month,
  String year,
) {
  DateTime currentDate = DateTime.now();
  return DateTime((int.parse(year) - 543), int.parse(month), currentDate.day);
}

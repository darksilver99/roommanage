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

import 'package:excel/excel.dart';
import 'package:excel/excel.dart' as exBorder;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import '/flutter_flow/custom_functions.dart' as functions;

Future<String> exportPaymentExcel(
  DateTime startDate,
  DateTime endDate,
) async {
  // Add your function code here!
  bool isGranted = false;
  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final info = await deviceInfo.androidInfo;
    if (int.parse(info.version.release) >= 13) {
      isGranted = true;
    } else {
      var status = await Permission.storage.request();
      if (status.isGranted) {
        isGranted = true;
      }
    }
  } else {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      isGranted = true;
    }
  }

  if (!isGranted) {
    return '';
  }

  //getData
  QuerySnapshot<Map<String, dynamic>> rs = await FirebaseFirestore.instance
      .collection(
          '${FFAppState().customerData.customerRef!.path}/tmp_payment_room_list')
      .where('create_date', isGreaterThanOrEqualTo: startDate)
      .where('create_date', isLessThanOrEqualTo: endDate)
      .orderBy("create_date", descending: false)
      .get();

  if (rs.size == 0) {
    return "No Data";
  }

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];

  CellStyle cellStyle = CellStyle(
    backgroundColorHex: ExcelColor.fromHexString('#1AFF1A'),
    horizontalAlign: HorizontalAlign.Center,
    bold: true,
    leftBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    rightBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    topBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    bottomBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
  );

  // title
  var cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0));

  String title =
      'รายงานการชำระเงิน ประจำวันที่ ${functions.dateTh(startDate)} ถึง ${functions.dateTh(endDate)}';
  cell.value = TextCellValue(title);
  cell.cellStyle = CellStyle(fontSize: 22, bold: true);

  // Add headers
  List<Map<String, dynamic>> header = [
    {
      "text": "ชื่อ-สกุล",
      "field": "full_name",
    },
    {
      "text": "เลขประจำตัวประชาชน",
      "field": "id_card_number",
    },
    {
      "text": "เบอร์โทรศัพท์",
      "field": "phone",
    },
    {
      "text": "ห้อง",
      "field": "room_subject",
    },
    {
      "text": "ประเภทการจ่าย",
      "field": "subject",
    },
    {
      "text": "จำนวนเงิน",
      "field": "price",
    },
    {
      "text": "หลักฐานการโอนเงิน",
      "field": "image_slip",
    },
    {
      "text": "หมายเหตุ",
      "field": "detail",
    },
    {
      "text": "วันที่บันทึกข้อมูล",
      "field": "create_date",
    }
  ];

  for (var i = 0; i < header.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 1));
    cell.value = TextCellValue(header[i]["text"]);
    cell.cellStyle = cellStyle;
    sheetObject.setColumnAutoFit(i);
  }

  // Add body
  for (int i = 0; i < rs.size; i++) {
    for (int j = 0; j < header.length; j++) {
      var field = header[j]["field"];
      var cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 2));
      try {
        if (field == "create_date") {
          cell
            ..value =
                TextCellValue(functions.dateTh(rs.docs[i][field].toDate())!)
            ..cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Center);
        } else if (field == "image_slip") {
          cell
            ..value =
                FormulaCellValue('HYPERLINK("${rs.docs[i][field]}", "ดูสลิป")')
            ..cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Center);
        } else {
          String val = (rs.docs[i][field] == null || rs.docs[i][field] == "")
              ? "-"
              : rs.docs[i][field].toString();
          cell
            ..value = TextCellValue(val)
            ..cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Center);
        }
      } catch (e) {
        cell
          ..value = TextCellValue("-")
          ..cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Center);
      }
    }
  }

  // Auto-size columns
  for (int col = 0; col < header.length; col++) {
    sheetObject.setColumnWidth(col, 25);

    //sheetObject.setDefaultColumnWidth(30);
    //sheetObject.setColumnAutoFit(col);
  }

  Directory dir = await getApplicationDocumentsDirectory();
  //Directory dir = Directory('/storage/emulated/0/Download');
  List<int>? fileBytes = excel.save();
  var path = File('${dir.path}/รายงานการชำระเงิน.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

  print(path);

  return path.path;
}

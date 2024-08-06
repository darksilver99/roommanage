import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  TmpCustomerDataStruct _tmpCustomerData = TmpCustomerDataStruct();
  TmpCustomerDataStruct get tmpCustomerData => _tmpCustomerData;
  set tmpCustomerData(TmpCustomerDataStruct value) {
    _tmpCustomerData = value;
  }

  void updateTmpCustomerDataStruct(Function(TmpCustomerDataStruct) updateFn) {
    updateFn(_tmpCustomerData);
  }
}

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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_currentDropdownSelected')) {
        try {
          final serializedData =
              prefs.getString('ff_currentDropdownSelected') ?? '{}';
          _currentDropdownSelected =
              CurrentDropdownSelectedDataStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _currentBackgroundNumber = prefs.getInt('ff_currentBackgroundNumber') ??
          _currentBackgroundNumber;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
  }

  int _appBuildVersion = 0;
  int get appBuildVersion => _appBuildVersion;
  set appBuildVersion(int value) {
    _appBuildVersion = value;
  }

  TmpCustomerDataStruct _tmpCustomerData = TmpCustomerDataStruct();
  TmpCustomerDataStruct get tmpCustomerData => _tmpCustomerData;
  set tmpCustomerData(TmpCustomerDataStruct value) {
    _tmpCustomerData = value;
  }

  void updateTmpCustomerDataStruct(Function(TmpCustomerDataStruct) updateFn) {
    updateFn(_tmpCustomerData);
  }

  DocumentReference? _customerReference;
  DocumentReference? get customerReference => _customerReference;
  set customerReference(DocumentReference? value) {
    _customerReference = value;
  }

  List<StatusDataStruct> _roomStatusList = [
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"ว่าง\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"ไม่ว่าง\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"ปิดปรับปรุง\"}'))
  ];
  List<StatusDataStruct> get roomStatusList => _roomStatusList;
  set roomStatusList(List<StatusDataStruct> value) {
    _roomStatusList = value;
  }

  void addToRoomStatusList(StatusDataStruct value) {
    roomStatusList.add(value);
  }

  void removeFromRoomStatusList(StatusDataStruct value) {
    roomStatusList.remove(value);
  }

  void removeAtIndexFromRoomStatusList(int index) {
    roomStatusList.removeAt(index);
  }

  void updateRoomStatusListAtIndex(
    int index,
    StatusDataStruct Function(StatusDataStruct) updateFn,
  ) {
    roomStatusList[index] = updateFn(_roomStatusList[index]);
  }

  void insertAtIndexInRoomStatusList(int index, StatusDataStruct value) {
    roomStatusList.insert(index, value);
  }

  List<BuildingDataStruct> _buildingList = [];
  List<BuildingDataStruct> get buildingList => _buildingList;
  set buildingList(List<BuildingDataStruct> value) {
    _buildingList = value;
  }

  void addToBuildingList(BuildingDataStruct value) {
    buildingList.add(value);
  }

  void removeFromBuildingList(BuildingDataStruct value) {
    buildingList.remove(value);
  }

  void removeAtIndexFromBuildingList(int index) {
    buildingList.removeAt(index);
  }

  void updateBuildingListAtIndex(
    int index,
    BuildingDataStruct Function(BuildingDataStruct) updateFn,
  ) {
    buildingList[index] = updateFn(_buildingList[index]);
  }

  void insertAtIndexInBuildingList(int index, BuildingDataStruct value) {
    buildingList.insert(index, value);
  }

  CurrentDropdownSelectedDataStruct _currentDropdownSelected =
      CurrentDropdownSelectedDataStruct();
  CurrentDropdownSelectedDataStruct get currentDropdownSelected =>
      _currentDropdownSelected;
  set currentDropdownSelected(CurrentDropdownSelectedDataStruct value) {
    _currentDropdownSelected = value;
    prefs.setString('ff_currentDropdownSelected', value.serialize());
  }

  void updateCurrentDropdownSelectedStruct(
      Function(CurrentDropdownSelectedDataStruct) updateFn) {
    updateFn(_currentDropdownSelected);
    prefs.setString(
        'ff_currentDropdownSelected', _currentDropdownSelected.serialize());
  }

  List<StatusSelectedDataStruct> _statusSelectedList = [
    StatusSelectedDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"isSelected\":\"true\"}')),
    StatusSelectedDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"isSelected\":\"true\"}')),
    StatusSelectedDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"isSelected\":\"true\"}'))
  ];
  List<StatusSelectedDataStruct> get statusSelectedList => _statusSelectedList;
  set statusSelectedList(List<StatusSelectedDataStruct> value) {
    _statusSelectedList = value;
  }

  void addToStatusSelectedList(StatusSelectedDataStruct value) {
    statusSelectedList.add(value);
  }

  void removeFromStatusSelectedList(StatusSelectedDataStruct value) {
    statusSelectedList.remove(value);
  }

  void removeAtIndexFromStatusSelectedList(int index) {
    statusSelectedList.removeAt(index);
  }

  void updateStatusSelectedListAtIndex(
    int index,
    StatusSelectedDataStruct Function(StatusSelectedDataStruct) updateFn,
  ) {
    statusSelectedList[index] = updateFn(_statusSelectedList[index]);
  }

  void insertAtIndexInStatusSelectedList(
      int index, StatusSelectedDataStruct value) {
    statusSelectedList.insert(index, value);
  }

  List<String> _paymentGuestTypeList = [
    'จ่ายรายวัน',
    'จ่ายรายเดือน',
    'จ่ายค่ามัดจำ',
    'อื่นๆ'
  ];
  List<String> get paymentGuestTypeList => _paymentGuestTypeList;
  set paymentGuestTypeList(List<String> value) {
    _paymentGuestTypeList = value;
  }

  void addToPaymentGuestTypeList(String value) {
    paymentGuestTypeList.add(value);
  }

  void removeFromPaymentGuestTypeList(String value) {
    paymentGuestTypeList.remove(value);
  }

  void removeAtIndexFromPaymentGuestTypeList(int index) {
    paymentGuestTypeList.removeAt(index);
  }

  void updatePaymentGuestTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    paymentGuestTypeList[index] = updateFn(_paymentGuestTypeList[index]);
  }

  void insertAtIndexInPaymentGuestTypeList(int index, String value) {
    paymentGuestTypeList.insert(index, value);
  }

  DocumentReference? _tmpRoomRef;
  DocumentReference? get tmpRoomRef => _tmpRoomRef;
  set tmpRoomRef(DocumentReference? value) {
    _tmpRoomRef = value;
  }

  DocumentReference? _tmpGuestRef;
  DocumentReference? get tmpGuestRef => _tmpGuestRef;
  set tmpGuestRef(DocumentReference? value) {
    _tmpGuestRef = value;
  }

  int _currentBackgroundNumber = 1;
  int get currentBackgroundNumber => _currentBackgroundNumber;
  set currentBackgroundNumber(int value) {
    _currentBackgroundNumber = value;
    prefs.setInt('ff_currentBackgroundNumber', value);
  }

  bool _isCreateBuildingFromSetting = false;
  bool get isCreateBuildingFromSetting => _isCreateBuildingFromSetting;
  set isCreateBuildingFromSetting(bool value) {
    _isCreateBuildingFromSetting = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
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
    _safeInit(() {
      _isSkipOCRAlert = prefs.getBool('ff_isSkipOCRAlert') ?? _isSkipOCRAlert;
    });
    _safeInit(() {
      _isSkipExpireAlert =
          prefs.getBool('ff_isSkipExpireAlert') ?? _isSkipExpireAlert;
    });
    _safeInit(() {
      _currentDate = prefs.containsKey('ff_currentDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_currentDate')!)
          : _currentDate;
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

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  bool _isSkipOCRAlert = false;
  bool get isSkipOCRAlert => _isSkipOCRAlert;
  set isSkipOCRAlert(bool value) {
    _isSkipOCRAlert = value;
    prefs.setBool('ff_isSkipOCRAlert', value);
  }

  bool _isSkipExpireAlert = false;
  bool get isSkipExpireAlert => _isSkipExpireAlert;
  set isSkipExpireAlert(bool value) {
    _isSkipExpireAlert = value;
    prefs.setBool('ff_isSkipExpireAlert', value);
  }

  DateTime? _currentDate = DateTime.fromMillisecondsSinceEpoch(-25200000);
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
    value != null
        ? prefs.setInt('ff_currentDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_currentDate');
  }

  CustomerDataStruct _customerData = CustomerDataStruct();
  CustomerDataStruct get customerData => _customerData;
  set customerData(CustomerDataStruct value) {
    _customerData = value;
  }

  void updateCustomerDataStruct(Function(CustomerDataStruct) updateFn) {
    updateFn(_customerData);
  }

  List<StatusDataStruct> _guestStatusList = [
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"เข้าพัก, จอง\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"ยกเลิก\"}')),
    StatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"4\",\"subject\":\"เช็คเอาท์แล้ว\"}'))
  ];
  List<StatusDataStruct> get guestStatusList => _guestStatusList;
  set guestStatusList(List<StatusDataStruct> value) {
    _guestStatusList = value;
  }

  void addToGuestStatusList(StatusDataStruct value) {
    guestStatusList.add(value);
  }

  void removeFromGuestStatusList(StatusDataStruct value) {
    guestStatusList.remove(value);
  }

  void removeAtIndexFromGuestStatusList(int index) {
    guestStatusList.removeAt(index);
  }

  void updateGuestStatusListAtIndex(
    int index,
    StatusDataStruct Function(StatusDataStruct) updateFn,
  ) {
    guestStatusList[index] = updateFn(_guestStatusList[index]);
  }

  void insertAtIndexInGuestStatusList(int index, StatusDataStruct value) {
    guestStatusList.insert(index, value);
  }

  DateTime? _tmpBookingDateSelected;
  DateTime? get tmpBookingDateSelected => _tmpBookingDateSelected;
  set tmpBookingDateSelected(DateTime? value) {
    _tmpBookingDateSelected = value;
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

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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

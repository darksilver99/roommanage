// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentDropdownSelectedDataStruct extends FFFirebaseStruct {
  CurrentDropdownSelectedDataStruct({
    String? buildingDoc,
    String? floorNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _buildingDoc = buildingDoc,
        _floorNumber = floorNumber,
        super(firestoreUtilData);

  // "building_doc" field.
  String? _buildingDoc;
  String get buildingDoc => _buildingDoc ?? '';
  set buildingDoc(String? val) => _buildingDoc = val;

  bool hasBuildingDoc() => _buildingDoc != null;

  // "floor_number" field.
  String? _floorNumber;
  String get floorNumber => _floorNumber ?? '';
  set floorNumber(String? val) => _floorNumber = val;

  bool hasFloorNumber() => _floorNumber != null;

  static CurrentDropdownSelectedDataStruct fromMap(Map<String, dynamic> data) =>
      CurrentDropdownSelectedDataStruct(
        buildingDoc: data['building_doc'] as String?,
        floorNumber: data['floor_number'] as String?,
      );

  static CurrentDropdownSelectedDataStruct? maybeFromMap(dynamic data) => data
          is Map
      ? CurrentDropdownSelectedDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'building_doc': _buildingDoc,
        'floor_number': _floorNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'building_doc': serializeParam(
          _buildingDoc,
          ParamType.String,
        ),
        'floor_number': serializeParam(
          _floorNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static CurrentDropdownSelectedDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CurrentDropdownSelectedDataStruct(
        buildingDoc: deserializeParam(
          data['building_doc'],
          ParamType.String,
          false,
        ),
        floorNumber: deserializeParam(
          data['floor_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CurrentDropdownSelectedDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CurrentDropdownSelectedDataStruct &&
        buildingDoc == other.buildingDoc &&
        floorNumber == other.floorNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([buildingDoc, floorNumber]);
}

CurrentDropdownSelectedDataStruct createCurrentDropdownSelectedDataStruct({
  String? buildingDoc,
  String? floorNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CurrentDropdownSelectedDataStruct(
      buildingDoc: buildingDoc,
      floorNumber: floorNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CurrentDropdownSelectedDataStruct? updateCurrentDropdownSelectedDataStruct(
  CurrentDropdownSelectedDataStruct? currentDropdownSelectedData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    currentDropdownSelectedData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCurrentDropdownSelectedDataStructData(
  Map<String, dynamic> firestoreData,
  CurrentDropdownSelectedDataStruct? currentDropdownSelectedData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (currentDropdownSelectedData == null) {
    return;
  }
  if (currentDropdownSelectedData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      currentDropdownSelectedData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final currentDropdownSelectedDataData =
      getCurrentDropdownSelectedDataFirestoreData(
          currentDropdownSelectedData, forFieldValue);
  final nestedData = currentDropdownSelectedDataData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      currentDropdownSelectedData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCurrentDropdownSelectedDataFirestoreData(
  CurrentDropdownSelectedDataStruct? currentDropdownSelectedData, [
  bool forFieldValue = false,
]) {
  if (currentDropdownSelectedData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(currentDropdownSelectedData.toMap());

  // Add any Firestore field values
  currentDropdownSelectedData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCurrentDropdownSelectedDataListFirestoreData(
  List<CurrentDropdownSelectedDataStruct>? currentDropdownSelectedDatas,
) =>
    currentDropdownSelectedDatas
        ?.map((e) => getCurrentDropdownSelectedDataFirestoreData(e, true))
        .toList() ??
    [];

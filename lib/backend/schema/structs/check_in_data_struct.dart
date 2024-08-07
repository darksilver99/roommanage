// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckInDataStruct extends FFFirebaseStruct {
  CheckInDataStruct({
    String? isUpdate,
    DateTime? endDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isUpdate = isUpdate,
        _endDate = endDate,
        super(firestoreUtilData);

  // "isUpdate" field.
  String? _isUpdate;
  String get isUpdate => _isUpdate ?? '';
  set isUpdate(String? val) => _isUpdate = val;

  bool hasIsUpdate() => _isUpdate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  static CheckInDataStruct fromMap(Map<String, dynamic> data) =>
      CheckInDataStruct(
        isUpdate: data['isUpdate'] as String?,
        endDate: data['endDate'] as DateTime?,
      );

  static CheckInDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckInDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isUpdate': _isUpdate,
        'endDate': _endDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isUpdate': serializeParam(
          _isUpdate,
          ParamType.String,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CheckInDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckInDataStruct(
        isUpdate: deserializeParam(
          data['isUpdate'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CheckInDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckInDataStruct &&
        isUpdate == other.isUpdate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode => const ListEquality().hash([isUpdate, endDate]);
}

CheckInDataStruct createCheckInDataStruct({
  String? isUpdate,
  DateTime? endDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckInDataStruct(
      isUpdate: isUpdate,
      endDate: endDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckInDataStruct? updateCheckInDataStruct(
  CheckInDataStruct? checkInData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkInData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckInDataStructData(
  Map<String, dynamic> firestoreData,
  CheckInDataStruct? checkInData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkInData == null) {
    return;
  }
  if (checkInData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkInData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkInDataData =
      getCheckInDataFirestoreData(checkInData, forFieldValue);
  final nestedData =
      checkInDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkInData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckInDataFirestoreData(
  CheckInDataStruct? checkInData, [
  bool forFieldValue = false,
]) {
  if (checkInData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkInData.toMap());

  // Add any Firestore field values
  checkInData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckInDataListFirestoreData(
  List<CheckInDataStruct>? checkInDatas,
) =>
    checkInDatas?.map((e) => getCheckInDataFirestoreData(e, true)).toList() ??
    [];

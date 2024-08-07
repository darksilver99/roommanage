// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusSelectedDataStruct extends FFFirebaseStruct {
  StatusSelectedDataStruct({
    int? status,
    bool? isSelected,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _isSelected = isSelected,
        super(firestoreUtilData);

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? true;
  set isSelected(bool? val) => _isSelected = val;

  bool hasIsSelected() => _isSelected != null;

  static StatusSelectedDataStruct fromMap(Map<String, dynamic> data) =>
      StatusSelectedDataStruct(
        status: castToType<int>(data['status']),
        isSelected: data['isSelected'] as bool?,
      );

  static StatusSelectedDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StatusSelectedDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'isSelected': _isSelected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static StatusSelectedDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StatusSelectedDataStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'StatusSelectedDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusSelectedDataStruct &&
        status == other.status &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => const ListEquality().hash([status, isSelected]);
}

StatusSelectedDataStruct createStatusSelectedDataStruct({
  int? status,
  bool? isSelected,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusSelectedDataStruct(
      status: status,
      isSelected: isSelected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusSelectedDataStruct? updateStatusSelectedDataStruct(
  StatusSelectedDataStruct? statusSelectedData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statusSelectedData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusSelectedDataStructData(
  Map<String, dynamic> firestoreData,
  StatusSelectedDataStruct? statusSelectedData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statusSelectedData == null) {
    return;
  }
  if (statusSelectedData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statusSelectedData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusSelectedDataData =
      getStatusSelectedDataFirestoreData(statusSelectedData, forFieldValue);
  final nestedData =
      statusSelectedDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      statusSelectedData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusSelectedDataFirestoreData(
  StatusSelectedDataStruct? statusSelectedData, [
  bool forFieldValue = false,
]) {
  if (statusSelectedData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statusSelectedData.toMap());

  // Add any Firestore field values
  statusSelectedData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusSelectedDataListFirestoreData(
  List<StatusSelectedDataStruct>? statusSelectedDatas,
) =>
    statusSelectedDatas
        ?.map((e) => getStatusSelectedDataFirestoreData(e, true))
        .toList() ??
    [];

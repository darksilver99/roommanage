// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TmpCustomerDataStruct extends FFFirebaseStruct {
  TmpCustomerDataStruct({
    String? customerName,
    String? buildingName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _customerName = customerName,
        _buildingName = buildingName,
        super(firestoreUtilData);

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  set customerName(String? val) => _customerName = val;

  bool hasCustomerName() => _customerName != null;

  // "building_name" field.
  String? _buildingName;
  String get buildingName => _buildingName ?? '';
  set buildingName(String? val) => _buildingName = val;

  bool hasBuildingName() => _buildingName != null;

  static TmpCustomerDataStruct fromMap(Map<String, dynamic> data) =>
      TmpCustomerDataStruct(
        customerName: data['customer_name'] as String?,
        buildingName: data['building_name'] as String?,
      );

  static TmpCustomerDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TmpCustomerDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customer_name': _customerName,
        'building_name': _buildingName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_name': serializeParam(
          _customerName,
          ParamType.String,
        ),
        'building_name': serializeParam(
          _buildingName,
          ParamType.String,
        ),
      }.withoutNulls;

  static TmpCustomerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TmpCustomerDataStruct(
        customerName: deserializeParam(
          data['customer_name'],
          ParamType.String,
          false,
        ),
        buildingName: deserializeParam(
          data['building_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TmpCustomerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TmpCustomerDataStruct &&
        customerName == other.customerName &&
        buildingName == other.buildingName;
  }

  @override
  int get hashCode => const ListEquality().hash([customerName, buildingName]);
}

TmpCustomerDataStruct createTmpCustomerDataStruct({
  String? customerName,
  String? buildingName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TmpCustomerDataStruct(
      customerName: customerName,
      buildingName: buildingName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TmpCustomerDataStruct? updateTmpCustomerDataStruct(
  TmpCustomerDataStruct? tmpCustomerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tmpCustomerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTmpCustomerDataStructData(
  Map<String, dynamic> firestoreData,
  TmpCustomerDataStruct? tmpCustomerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tmpCustomerData == null) {
    return;
  }
  if (tmpCustomerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tmpCustomerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tmpCustomerDataData =
      getTmpCustomerDataFirestoreData(tmpCustomerData, forFieldValue);
  final nestedData =
      tmpCustomerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tmpCustomerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTmpCustomerDataFirestoreData(
  TmpCustomerDataStruct? tmpCustomerData, [
  bool forFieldValue = false,
]) {
  if (tmpCustomerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tmpCustomerData.toMap());

  // Add any Firestore field values
  tmpCustomerData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTmpCustomerDataListFirestoreData(
  List<TmpCustomerDataStruct>? tmpCustomerDatas,
) =>
    tmpCustomerDatas
        ?.map((e) => getTmpCustomerDataFirestoreData(e, true))
        .toList() ??
    [];

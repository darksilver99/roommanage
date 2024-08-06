// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuildingDataStruct extends FFFirebaseStruct {
  BuildingDataStruct({
    String? subject,
    int? totalFloor,
    DocumentReference? buildingRef,
    String? buildingPath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _totalFloor = totalFloor,
        _buildingRef = buildingRef,
        _buildingPath = buildingPath,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "total_floor" field.
  int? _totalFloor;
  int get totalFloor => _totalFloor ?? 0;
  set totalFloor(int? val) => _totalFloor = val;

  void incrementTotalFloor(int amount) => totalFloor = totalFloor + amount;

  bool hasTotalFloor() => _totalFloor != null;

  // "building_ref" field.
  DocumentReference? _buildingRef;
  DocumentReference? get buildingRef => _buildingRef;
  set buildingRef(DocumentReference? val) => _buildingRef = val;

  bool hasBuildingRef() => _buildingRef != null;

  // "building_path" field.
  String? _buildingPath;
  String get buildingPath => _buildingPath ?? '';
  set buildingPath(String? val) => _buildingPath = val;

  bool hasBuildingPath() => _buildingPath != null;

  static BuildingDataStruct fromMap(Map<String, dynamic> data) =>
      BuildingDataStruct(
        subject: data['subject'] as String?,
        totalFloor: castToType<int>(data['total_floor']),
        buildingRef: data['building_ref'] as DocumentReference?,
        buildingPath: data['building_path'] as String?,
      );

  static BuildingDataStruct? maybeFromMap(dynamic data) => data is Map
      ? BuildingDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'total_floor': _totalFloor,
        'building_ref': _buildingRef,
        'building_path': _buildingPath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'total_floor': serializeParam(
          _totalFloor,
          ParamType.int,
        ),
        'building_ref': serializeParam(
          _buildingRef,
          ParamType.DocumentReference,
        ),
        'building_path': serializeParam(
          _buildingPath,
          ParamType.String,
        ),
      }.withoutNulls;

  static BuildingDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BuildingDataStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        totalFloor: deserializeParam(
          data['total_floor'],
          ParamType.int,
          false,
        ),
        buildingRef: deserializeParam(
          data['building_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer_name', 'building_list'],
        ),
        buildingPath: deserializeParam(
          data['building_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BuildingDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuildingDataStruct &&
        subject == other.subject &&
        totalFloor == other.totalFloor &&
        buildingRef == other.buildingRef &&
        buildingPath == other.buildingPath;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subject, totalFloor, buildingRef, buildingPath]);
}

BuildingDataStruct createBuildingDataStruct({
  String? subject,
  int? totalFloor,
  DocumentReference? buildingRef,
  String? buildingPath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuildingDataStruct(
      subject: subject,
      totalFloor: totalFloor,
      buildingRef: buildingRef,
      buildingPath: buildingPath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BuildingDataStruct? updateBuildingDataStruct(
  BuildingDataStruct? buildingData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    buildingData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBuildingDataStructData(
  Map<String, dynamic> firestoreData,
  BuildingDataStruct? buildingData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buildingData == null) {
    return;
  }
  if (buildingData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && buildingData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buildingDataData =
      getBuildingDataFirestoreData(buildingData, forFieldValue);
  final nestedData =
      buildingDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = buildingData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBuildingDataFirestoreData(
  BuildingDataStruct? buildingData, [
  bool forFieldValue = false,
]) {
  if (buildingData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(buildingData.toMap());

  // Add any Firestore field values
  buildingData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuildingDataListFirestoreData(
  List<BuildingDataStruct>? buildingDatas,
) =>
    buildingDatas?.map((e) => getBuildingDataFirestoreData(e, true)).toList() ??
    [];

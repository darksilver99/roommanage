import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomListRecord extends FirestoreRecord {
  RoomListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "building_ref" field.
  DocumentReference? _buildingRef;
  DocumentReference? get buildingRef => _buildingRef;
  bool hasBuildingRef() => _buildingRef != null;

  // "floor_number" field.
  int? _floorNumber;
  int get floorNumber => _floorNumber ?? 0;
  bool hasFloorNumber() => _floorNumber != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "is_daily" field.
  bool? _isDaily;
  bool get isDaily => _isDaily ?? false;
  bool hasIsDaily() => _isDaily != null;

  // "guest_ref" field.
  DocumentReference? _guestRef;
  DocumentReference? get guestRef => _guestRef;
  bool hasGuestRef() => _guestRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _buildingRef = snapshotData['building_ref'] as DocumentReference?;
    _floorNumber = castToType<int>(snapshotData['floor_number']);
    _endDate = snapshotData['end_date'] as DateTime?;
    _isDaily = snapshotData['is_daily'] as bool?;
    _guestRef = snapshotData['guest_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('room_list')
          : FirebaseFirestore.instance.collectionGroup('room_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('room_list').doc(id);

  static Stream<RoomListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomListRecord.fromSnapshot(s));

  static Future<RoomListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomListRecord.fromSnapshot(s));

  static RoomListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RoomListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  String? detail,
  DocumentReference? buildingRef,
  int? floorNumber,
  DateTime? endDate,
  bool? isDaily,
  DocumentReference? guestRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'detail': detail,
      'building_ref': buildingRef,
      'floor_number': floorNumber,
      'end_date': endDate,
      'is_daily': isDaily,
      'guest_ref': guestRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RoomListRecordDocumentEquality implements Equality<RoomListRecord> {
  const RoomListRecordDocumentEquality();

  @override
  bool equals(RoomListRecord? e1, RoomListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.buildingRef == e2?.buildingRef &&
        e1?.floorNumber == e2?.floorNumber &&
        e1?.endDate == e2?.endDate &&
        e1?.isDaily == e2?.isDaily &&
        e1?.guestRef == e2?.guestRef;
  }

  @override
  int hash(RoomListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.detail,
        e?.buildingRef,
        e?.floorNumber,
        e?.endDate,
        e?.isDaily,
        e?.guestRef
      ]);

  @override
  bool isValidKey(Object? o) => o is RoomListRecord;
}

import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestListRecord extends FirestoreRecord {
  GuestListRecord._(
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

  // "pre_name" field.
  String? _preName;
  String get preName => _preName ?? '';
  bool hasPreName() => _preName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "id_card_number" field.
  String? _idCardNumber;
  String get idCardNumber => _idCardNumber ?? '';
  bool hasIdCardNumber() => _idCardNumber != null;

  // "total_guest" field.
  int? _totalGuest;
  int get totalGuest => _totalGuest ?? 0;
  bool hasTotalGuest() => _totalGuest != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _preName = snapshotData['pre_name'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _idCardNumber = snapshotData['id_card_number'] as String?;
    _totalGuest = castToType<int>(snapshotData['total_guest']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('${FFAppState().tmpRoomRef!.path}/guest_list');

  static Stream<GuestListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GuestListRecord.fromSnapshot(s));

  static Future<GuestListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GuestListRecord.fromSnapshot(s));

  static GuestListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GuestListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GuestListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GuestListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GuestListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GuestListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGuestListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? preName,
  String? firstName,
  String? lastName,
  DateTime? startDate,
  DateTime? endDate,
  String? idCardNumber,
  int? totalGuest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'pre_name': preName,
      'first_name': firstName,
      'last_name': lastName,
      'start_date': startDate,
      'end_date': endDate,
      'id_card_number': idCardNumber,
      'total_guest': totalGuest,
    }.withoutNulls,
  );

  return firestoreData;
}

class GuestListRecordDocumentEquality implements Equality<GuestListRecord> {
  const GuestListRecordDocumentEquality();

  @override
  bool equals(GuestListRecord? e1, GuestListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.preName == e2?.preName &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.idCardNumber == e2?.idCardNumber &&
        e1?.totalGuest == e2?.totalGuest;
  }

  @override
  int hash(GuestListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.preName,
        e?.firstName,
        e?.lastName,
        e?.startDate,
        e?.endDate,
        e?.idCardNumber,
        e?.totalGuest
      ]);

  @override
  bool isValidKey(Object? o) => o is GuestListRecord;
}

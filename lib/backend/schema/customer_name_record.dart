import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerNameRecord extends FirestoreRecord {
  CustomerNameRecord._(
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

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "is_first_time" field.
  bool? _isFirstTime;
  bool get isFirstTime => _isFirstTime ?? false;
  bool hasIsFirstTime() => _isFirstTime != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _expireDate = snapshotData['expire_date'] as DateTime?;
    _customerName = snapshotData['customer_name'] as String?;
    _isFirstTime = snapshotData['is_first_time'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer_name');

  static Stream<CustomerNameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerNameRecord.fromSnapshot(s));

  static Future<CustomerNameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerNameRecord.fromSnapshot(s));

  static CustomerNameRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerNameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerNameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerNameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerNameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerNameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerNameRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  DateTime? expireDate,
  String? customerName,
  bool? isFirstTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'expire_date': expireDate,
      'customer_name': customerName,
      'is_first_time': isFirstTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerNameRecordDocumentEquality
    implements Equality<CustomerNameRecord> {
  const CustomerNameRecordDocumentEquality();

  @override
  bool equals(CustomerNameRecord? e1, CustomerNameRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.expireDate == e2?.expireDate &&
        e1?.customerName == e2?.customerName &&
        e1?.isFirstTime == e2?.isFirstTime;
  }

  @override
  int hash(CustomerNameRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.expireDate,
        e?.customerName,
        e?.isFirstTime
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerNameRecord;
}

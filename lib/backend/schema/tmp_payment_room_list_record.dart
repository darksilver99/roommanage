import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TmpPaymentRoomListRecord extends FirestoreRecord {
  TmpPaymentRoomListRecord._(
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

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image_slip" field.
  String? _imageSlip;
  String get imageSlip => _imageSlip ?? '';
  bool hasImageSlip() => _imageSlip != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "payment_room_ref" field.
  DocumentReference? _paymentRoomRef;
  DocumentReference? get paymentRoomRef => _paymentRoomRef;
  bool hasPaymentRoomRef() => _paymentRoomRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _imageSlip = snapshotData['image_slip'] as String?;
    _detail = snapshotData['detail'] as String?;
    _paymentRoomRef = snapshotData['payment_room_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tmp_payment_room_list')
          : FirebaseFirestore.instance.collectionGroup('tmp_payment_room_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tmp_payment_room_list').doc(id);

  static Stream<TmpPaymentRoomListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TmpPaymentRoomListRecord.fromSnapshot(s));

  static Future<TmpPaymentRoomListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TmpPaymentRoomListRecord.fromSnapshot(s));

  static TmpPaymentRoomListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TmpPaymentRoomListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TmpPaymentRoomListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TmpPaymentRoomListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TmpPaymentRoomListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TmpPaymentRoomListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTmpPaymentRoomListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  double? price,
  String? imageSlip,
  String? detail,
  DocumentReference? paymentRoomRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'price': price,
      'image_slip': imageSlip,
      'detail': detail,
      'payment_room_ref': paymentRoomRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TmpPaymentRoomListRecordDocumentEquality
    implements Equality<TmpPaymentRoomListRecord> {
  const TmpPaymentRoomListRecordDocumentEquality();

  @override
  bool equals(TmpPaymentRoomListRecord? e1, TmpPaymentRoomListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.price == e2?.price &&
        e1?.imageSlip == e2?.imageSlip &&
        e1?.detail == e2?.detail &&
        e1?.paymentRoomRef == e2?.paymentRoomRef;
  }

  @override
  int hash(TmpPaymentRoomListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.price,
        e?.imageSlip,
        e?.detail,
        e?.paymentRoomRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TmpPaymentRoomListRecord;
}

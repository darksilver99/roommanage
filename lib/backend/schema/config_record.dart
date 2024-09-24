import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigRecord extends FirestoreRecord {
  ConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "store_version" field.
  int? _storeVersion;
  int get storeVersion => _storeVersion ?? 0;
  bool hasStoreVersion() => _storeVersion != null;

  // "store_ios_link" field.
  String? _storeIosLink;
  String get storeIosLink => _storeIosLink ?? '';
  bool hasStoreIosLink() => _storeIosLink != null;

  // "store_android_link" field.
  String? _storeAndroidLink;
  String get storeAndroidLink => _storeAndroidLink ?? '';
  bool hasStoreAndroidLink() => _storeAndroidLink != null;

  // "policy_url" field.
  String? _policyUrl;
  String get policyUrl => _policyUrl ?? '';
  bool hasPolicyUrl() => _policyUrl != null;

  // "ocr_api" field.
  String? _ocrApi;
  String get ocrApi => _ocrApi ?? '';
  bool hasOcrApi() => _ocrApi != null;

  // "ocr_alert_text" field.
  List<String>? _ocrAlertText;
  List<String> get ocrAlertText => _ocrAlertText ?? const [];
  bool hasOcrAlertText() => _ocrAlertText != null;

  // "ocr_error_text" field.
  List<String>? _ocrErrorText;
  List<String> get ocrErrorText => _ocrErrorText ?? const [];
  bool hasOcrErrorText() => _ocrErrorText != null;

  // "free_day" field.
  int? _freeDay;
  int get freeDay => _freeDay ?? 0;
  bool hasFreeDay() => _freeDay != null;

  // "payment_alert_text" field.
  List<String>? _paymentAlertText;
  List<String> get paymentAlertText => _paymentAlertText ?? const [];
  bool hasPaymentAlertText() => _paymentAlertText != null;

  // "payment_detail_image" field.
  String? _paymentDetailImage;
  String get paymentDetailImage => _paymentDetailImage ?? '';
  bool hasPaymentDetailImage() => _paymentDetailImage != null;

  // "promotion_detail_image" field.
  String? _promotionDetailImage;
  String get promotionDetailImage => _promotionDetailImage ?? '';
  bool hasPromotionDetailImage() => _promotionDetailImage != null;

  // "contact" field.
  List<String>? _contact;
  List<String> get contact => _contact ?? const [];
  bool hasContact() => _contact != null;

  // "isReview" field.
  bool? _isReview;
  bool get isReview => _isReview ?? false;
  bool hasIsReview() => _isReview != null;

  void _initializeFields() {
    _storeVersion = castToType<int>(snapshotData['store_version']);
    _storeIosLink = snapshotData['store_ios_link'] as String?;
    _storeAndroidLink = snapshotData['store_android_link'] as String?;
    _policyUrl = snapshotData['policy_url'] as String?;
    _ocrApi = snapshotData['ocr_api'] as String?;
    _ocrAlertText = getDataList(snapshotData['ocr_alert_text']);
    _ocrErrorText = getDataList(snapshotData['ocr_error_text']);
    _freeDay = castToType<int>(snapshotData['free_day']);
    _paymentAlertText = getDataList(snapshotData['payment_alert_text']);
    _paymentDetailImage = snapshotData['payment_detail_image'] as String?;
    _promotionDetailImage = snapshotData['promotion_detail_image'] as String?;
    _contact = getDataList(snapshotData['contact']);
    _isReview = snapshotData['isReview'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigRecordData({
  int? storeVersion,
  String? storeIosLink,
  String? storeAndroidLink,
  String? policyUrl,
  String? ocrApi,
  int? freeDay,
  String? paymentDetailImage,
  String? promotionDetailImage,
  bool? isReview,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store_version': storeVersion,
      'store_ios_link': storeIosLink,
      'store_android_link': storeAndroidLink,
      'policy_url': policyUrl,
      'ocr_api': ocrApi,
      'free_day': freeDay,
      'payment_detail_image': paymentDetailImage,
      'promotion_detail_image': promotionDetailImage,
      'isReview': isReview,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    const listEquality = ListEquality();
    return e1?.storeVersion == e2?.storeVersion &&
        e1?.storeIosLink == e2?.storeIosLink &&
        e1?.storeAndroidLink == e2?.storeAndroidLink &&
        e1?.policyUrl == e2?.policyUrl &&
        e1?.ocrApi == e2?.ocrApi &&
        listEquality.equals(e1?.ocrAlertText, e2?.ocrAlertText) &&
        listEquality.equals(e1?.ocrErrorText, e2?.ocrErrorText) &&
        e1?.freeDay == e2?.freeDay &&
        listEquality.equals(e1?.paymentAlertText, e2?.paymentAlertText) &&
        e1?.paymentDetailImage == e2?.paymentDetailImage &&
        e1?.promotionDetailImage == e2?.promotionDetailImage &&
        listEquality.equals(e1?.contact, e2?.contact) &&
        e1?.isReview == e2?.isReview;
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality().hash([
        e?.storeVersion,
        e?.storeIosLink,
        e?.storeAndroidLink,
        e?.policyUrl,
        e?.ocrApi,
        e?.ocrAlertText,
        e?.ocrErrorText,
        e?.freeDay,
        e?.paymentAlertText,
        e?.paymentDetailImage,
        e?.promotionDetailImage,
        e?.contact,
        e?.isReview
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}

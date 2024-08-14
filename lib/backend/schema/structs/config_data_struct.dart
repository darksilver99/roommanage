// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends FFFirebaseStruct {
  ConfigDataStruct({
    String? ocrApi,
    String? policyUrl,
    List<String>? ocrAlertText,
    List<String>? ocrErrorText,
    int? freeDay,
    List<String>? paymentAlertText,
    String? paymentDetailImage,
    String? promotionDetailImage,
    List<String>? contact,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ocrApi = ocrApi,
        _policyUrl = policyUrl,
        _ocrAlertText = ocrAlertText,
        _ocrErrorText = ocrErrorText,
        _freeDay = freeDay,
        _paymentAlertText = paymentAlertText,
        _paymentDetailImage = paymentDetailImage,
        _promotionDetailImage = promotionDetailImage,
        _contact = contact,
        super(firestoreUtilData);

  // "ocr_api" field.
  String? _ocrApi;
  String get ocrApi => _ocrApi ?? '';
  set ocrApi(String? val) => _ocrApi = val;

  bool hasOcrApi() => _ocrApi != null;

  // "policy_url" field.
  String? _policyUrl;
  String get policyUrl => _policyUrl ?? '';
  set policyUrl(String? val) => _policyUrl = val;

  bool hasPolicyUrl() => _policyUrl != null;

  // "ocr_alert_text" field.
  List<String>? _ocrAlertText;
  List<String> get ocrAlertText => _ocrAlertText ?? const [];
  set ocrAlertText(List<String>? val) => _ocrAlertText = val;

  void updateOcrAlertText(Function(List<String>) updateFn) {
    updateFn(_ocrAlertText ??= []);
  }

  bool hasOcrAlertText() => _ocrAlertText != null;

  // "ocr_error_text" field.
  List<String>? _ocrErrorText;
  List<String> get ocrErrorText => _ocrErrorText ?? const [];
  set ocrErrorText(List<String>? val) => _ocrErrorText = val;

  void updateOcrErrorText(Function(List<String>) updateFn) {
    updateFn(_ocrErrorText ??= []);
  }

  bool hasOcrErrorText() => _ocrErrorText != null;

  // "free_day" field.
  int? _freeDay;
  int get freeDay => _freeDay ?? 0;
  set freeDay(int? val) => _freeDay = val;

  void incrementFreeDay(int amount) => freeDay = freeDay + amount;

  bool hasFreeDay() => _freeDay != null;

  // "payment_alert_text" field.
  List<String>? _paymentAlertText;
  List<String> get paymentAlertText => _paymentAlertText ?? const [];
  set paymentAlertText(List<String>? val) => _paymentAlertText = val;

  void updatePaymentAlertText(Function(List<String>) updateFn) {
    updateFn(_paymentAlertText ??= []);
  }

  bool hasPaymentAlertText() => _paymentAlertText != null;

  // "payment_detail_image" field.
  String? _paymentDetailImage;
  String get paymentDetailImage => _paymentDetailImage ?? '';
  set paymentDetailImage(String? val) => _paymentDetailImage = val;

  bool hasPaymentDetailImage() => _paymentDetailImage != null;

  // "promotion_detail_image" field.
  String? _promotionDetailImage;
  String get promotionDetailImage => _promotionDetailImage ?? '';
  set promotionDetailImage(String? val) => _promotionDetailImage = val;

  bool hasPromotionDetailImage() => _promotionDetailImage != null;

  // "contact" field.
  List<String>? _contact;
  List<String> get contact => _contact ?? const [];
  set contact(List<String>? val) => _contact = val;

  void updateContact(Function(List<String>) updateFn) {
    updateFn(_contact ??= []);
  }

  bool hasContact() => _contact != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        ocrApi: data['ocr_api'] as String?,
        policyUrl: data['policy_url'] as String?,
        ocrAlertText: getDataList(data['ocr_alert_text']),
        ocrErrorText: getDataList(data['ocr_error_text']),
        freeDay: castToType<int>(data['free_day']),
        paymentAlertText: getDataList(data['payment_alert_text']),
        paymentDetailImage: data['payment_detail_image'] as String?,
        promotionDetailImage: data['promotion_detail_image'] as String?,
        contact: getDataList(data['contact']),
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ocr_api': _ocrApi,
        'policy_url': _policyUrl,
        'ocr_alert_text': _ocrAlertText,
        'ocr_error_text': _ocrErrorText,
        'free_day': _freeDay,
        'payment_alert_text': _paymentAlertText,
        'payment_detail_image': _paymentDetailImage,
        'promotion_detail_image': _promotionDetailImage,
        'contact': _contact,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ocr_api': serializeParam(
          _ocrApi,
          ParamType.String,
        ),
        'policy_url': serializeParam(
          _policyUrl,
          ParamType.String,
        ),
        'ocr_alert_text': serializeParam(
          _ocrAlertText,
          ParamType.String,
          isList: true,
        ),
        'ocr_error_text': serializeParam(
          _ocrErrorText,
          ParamType.String,
          isList: true,
        ),
        'free_day': serializeParam(
          _freeDay,
          ParamType.int,
        ),
        'payment_alert_text': serializeParam(
          _paymentAlertText,
          ParamType.String,
          isList: true,
        ),
        'payment_detail_image': serializeParam(
          _paymentDetailImage,
          ParamType.String,
        ),
        'promotion_detail_image': serializeParam(
          _promotionDetailImage,
          ParamType.String,
        ),
        'contact': serializeParam(
          _contact,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        ocrApi: deserializeParam(
          data['ocr_api'],
          ParamType.String,
          false,
        ),
        policyUrl: deserializeParam(
          data['policy_url'],
          ParamType.String,
          false,
        ),
        ocrAlertText: deserializeParam<String>(
          data['ocr_alert_text'],
          ParamType.String,
          true,
        ),
        ocrErrorText: deserializeParam<String>(
          data['ocr_error_text'],
          ParamType.String,
          true,
        ),
        freeDay: deserializeParam(
          data['free_day'],
          ParamType.int,
          false,
        ),
        paymentAlertText: deserializeParam<String>(
          data['payment_alert_text'],
          ParamType.String,
          true,
        ),
        paymentDetailImage: deserializeParam(
          data['payment_detail_image'],
          ParamType.String,
          false,
        ),
        promotionDetailImage: deserializeParam(
          data['promotion_detail_image'],
          ParamType.String,
          false,
        ),
        contact: deserializeParam<String>(
          data['contact'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigDataStruct &&
        ocrApi == other.ocrApi &&
        policyUrl == other.policyUrl &&
        listEquality.equals(ocrAlertText, other.ocrAlertText) &&
        listEquality.equals(ocrErrorText, other.ocrErrorText) &&
        freeDay == other.freeDay &&
        listEquality.equals(paymentAlertText, other.paymentAlertText) &&
        paymentDetailImage == other.paymentDetailImage &&
        promotionDetailImage == other.promotionDetailImage &&
        listEquality.equals(contact, other.contact);
  }

  @override
  int get hashCode => const ListEquality().hash([
        ocrApi,
        policyUrl,
        ocrAlertText,
        ocrErrorText,
        freeDay,
        paymentAlertText,
        paymentDetailImage,
        promotionDetailImage,
        contact
      ]);
}

ConfigDataStruct createConfigDataStruct({
  String? ocrApi,
  String? policyUrl,
  int? freeDay,
  String? paymentDetailImage,
  String? promotionDetailImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigDataStruct(
      ocrApi: ocrApi,
      policyUrl: policyUrl,
      freeDay: freeDay,
      paymentDetailImage: paymentDetailImage,
      promotionDetailImage: promotionDetailImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigDataStruct? updateConfigDataStruct(
  ConfigDataStruct? configData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigDataStructData(
  Map<String, dynamic> firestoreData,
  ConfigDataStruct? configData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configData == null) {
    return;
  }
  if (configData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configDataData = getConfigDataFirestoreData(configData, forFieldValue);
  final nestedData = configDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigDataFirestoreData(
  ConfigDataStruct? configData, [
  bool forFieldValue = false,
]) {
  if (configData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configData.toMap());

  // Add any Firestore field values
  configData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigDataListFirestoreData(
  List<ConfigDataStruct>? configDatas,
) =>
    configDatas?.map((e) => getConfigDataFirestoreData(e, true)).toList() ?? [];

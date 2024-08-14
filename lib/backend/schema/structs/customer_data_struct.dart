// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerDataStruct extends FFFirebaseStruct {
  CustomerDataStruct({
    String? customerName,
    DateTime? expireDate,
    DocumentReference? customerRef,
    bool? isFirstTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _customerName = customerName,
        _expireDate = expireDate,
        _customerRef = customerRef,
        _isFirstTime = isFirstTime,
        super(firestoreUtilData);

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  set customerName(String? val) => _customerName = val;

  bool hasCustomerName() => _customerName != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? val) => _expireDate = val;

  bool hasExpireDate() => _expireDate != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  set customerRef(DocumentReference? val) => _customerRef = val;

  bool hasCustomerRef() => _customerRef != null;

  // "is_first_time" field.
  bool? _isFirstTime;
  bool get isFirstTime => _isFirstTime ?? false;
  set isFirstTime(bool? val) => _isFirstTime = val;

  bool hasIsFirstTime() => _isFirstTime != null;

  static CustomerDataStruct fromMap(Map<String, dynamic> data) =>
      CustomerDataStruct(
        customerName: data['customer_name'] as String?,
        expireDate: data['expire_date'] as DateTime?,
        customerRef: data['customer_ref'] as DocumentReference?,
        isFirstTime: data['is_first_time'] as bool?,
      );

  static CustomerDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customer_name': _customerName,
        'expire_date': _expireDate,
        'customer_ref': _customerRef,
        'is_first_time': _isFirstTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_name': serializeParam(
          _customerName,
          ParamType.String,
        ),
        'expire_date': serializeParam(
          _expireDate,
          ParamType.DateTime,
        ),
        'customer_ref': serializeParam(
          _customerRef,
          ParamType.DocumentReference,
        ),
        'is_first_time': serializeParam(
          _isFirstTime,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CustomerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerDataStruct(
        customerName: deserializeParam(
          data['customer_name'],
          ParamType.String,
          false,
        ),
        expireDate: deserializeParam(
          data['expire_date'],
          ParamType.DateTime,
          false,
        ),
        customerRef: deserializeParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer_name'],
        ),
        isFirstTime: deserializeParam(
          data['is_first_time'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CustomerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerDataStruct &&
        customerName == other.customerName &&
        expireDate == other.expireDate &&
        customerRef == other.customerRef &&
        isFirstTime == other.isFirstTime;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([customerName, expireDate, customerRef, isFirstTime]);
}

CustomerDataStruct createCustomerDataStruct({
  String? customerName,
  DateTime? expireDate,
  DocumentReference? customerRef,
  bool? isFirstTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomerDataStruct(
      customerName: customerName,
      expireDate: expireDate,
      customerRef: customerRef,
      isFirstTime: isFirstTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomerDataStruct? updateCustomerDataStruct(
  CustomerDataStruct? customerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomerDataStructData(
  Map<String, dynamic> firestoreData,
  CustomerDataStruct? customerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customerData == null) {
    return;
  }
  if (customerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customerDataData =
      getCustomerDataFirestoreData(customerData, forFieldValue);
  final nestedData =
      customerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomerDataFirestoreData(
  CustomerDataStruct? customerData, [
  bool forFieldValue = false,
]) {
  if (customerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customerData.toMap());

  // Add any Firestore field values
  customerData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomerDataListFirestoreData(
  List<CustomerDataStruct>? customerDatas,
) =>
    customerDatas?.map((e) => getCustomerDataFirestoreData(e, true)).toList() ??
    [];

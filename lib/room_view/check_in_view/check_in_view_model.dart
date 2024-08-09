import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'check_in_view_widget.dart' show CheckInViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckInViewModel extends FlutterFlowModel<CheckInViewWidget> {
  ///  Local state fields for this component.

  DateTime? startDate;

  DateTime? endDate;

  bool isDaily = true;

  String? allCardData;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - getBase64] action in Button widget.
  String? base64Result;
  // Stores action output result for [Backend Call - API (getORCData)] action in Button widget.
  ApiCallResponse? apiResult2ve;
  // State field(s) for preName widget.
  FocusNode? preNameFocusNode;
  TextEditingController? preNameTextController;
  String? Function(BuildContext, String?)? preNameTextControllerValidator;
  String? _preNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for idCard widget.
  FocusNode? idCardFocusNode;
  TextEditingController? idCardTextController;
  String? Function(BuildContext, String?)? idCardTextControllerValidator;
  String? _idCardTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  String? _textController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? isValid;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GuestListRecord? insertedGuest;

  @override
  void initState(BuildContext context) {
    preNameTextControllerValidator = _preNameTextControllerValidator;
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    idCardTextControllerValidator = _idCardTextControllerValidator;
    textController5Validator = _textController5Validator;
  }

  @override
  void dispose() {
    preNameFocusNode?.dispose();
    preNameTextController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    idCardFocusNode?.dispose();
    idCardTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}

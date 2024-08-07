import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/app_bar_view/app_bar_view_widget.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'create_floor_page_widget.dart' show CreateFloorPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateFloorPageModel extends FlutterFlowModel<CreateFloorPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // Model for AppBarView component.
  late AppBarViewModel appBarViewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CustomerNameRecord? insertCustomer;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BuildingListRecord? insertBuilding;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
    appBarViewModel = createModel(context, () => AppBarViewModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
    appBarViewModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

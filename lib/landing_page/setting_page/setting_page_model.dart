import '/auth/firebase_auth/auth_util.dart';
import '/component/background_view/background_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'setting_page_widget.dart' show SettingPageWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingPageModel extends FlutterFlowModel<SettingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // Stores action output result for [Action Block - ConfirmBlock] action in Button widget.
  bool? isConfirm;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
  }
}

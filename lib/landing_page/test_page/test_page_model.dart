import '/component/app_bar_view/app_bar_view_widget.dart';
import '/component/background_view/background_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'test_page_widget.dart' show TestPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestPageModel extends FlutterFlowModel<TestPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // Model for AppBarView component.
  late AppBarViewModel appBarViewModel;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
    appBarViewModel = createModel(context, () => AppBarViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
    appBarViewModel.dispose();
  }
}

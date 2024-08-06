import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/background_view/background_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  bool isHasCustomer = false;

  bool isHasRoom = false;

  int dataCount = 0;

  List<BuildingDataStruct> buildingDataList = [];
  void addToBuildingDataList(BuildingDataStruct item) =>
      buildingDataList.add(item);
  void removeFromBuildingDataList(BuildingDataStruct item) =>
      buildingDataList.remove(item);
  void removeAtIndexFromBuildingDataList(int index) =>
      buildingDataList.removeAt(index);
  void insertAtIndexInBuildingDataList(int index, BuildingDataStruct item) =>
      buildingDataList.insert(index, item);
  void updateBuildingDataListAtIndex(
          int index, Function(BuildingDataStruct) updateFn) =>
      buildingDataList[index] = updateFn(buildingDataList[index]);

  List<int> floorList = [];
  void addToFloorList(int item) => floorList.add(item);
  void removeFromFloorList(int item) => floorList.remove(item);
  void removeAtIndexFromFloorList(int index) => floorList.removeAt(index);
  void insertAtIndexInFloorList(int index, int item) =>
      floorList.insert(index, item);
  void updateFloorListAtIndex(int index, Function(int) updateFn) =>
      floorList[index] = updateFn(floorList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  CustomerNameRecord? customerResult;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<BuildingListRecord>? buildingResult;
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
  }
}

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_building_and_floor_view_widget.dart'
    show SelectBuildingAndFloorViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectBuildingAndFloorViewModel
    extends FlutterFlowModel<SelectBuildingAndFloorViewWidget> {
  ///  Local state fields for this component.

  List<String> floorList = [];
  void addToFloorList(String item) => floorList.add(item);
  void removeFromFloorList(String item) => floorList.remove(item);
  void removeAtIndexFromFloorList(int index) => floorList.removeAt(index);
  void insertAtIndexInFloorList(int index, String item) =>
      floorList.insert(index, item);
  void updateFloorListAtIndex(int index, Function(String) updateFn) =>
      floorList[index] = updateFn(floorList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

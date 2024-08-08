import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/room_view/payment_detail_view/payment_detail_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'guest_payment_history_view_widget.dart'
    show GuestPaymentHistoryViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GuestPaymentHistoryViewModel
    extends FlutterFlowModel<GuestPaymentHistoryViewWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> tmpImageList = [];
  void addToTmpImageList(FFUploadedFile item) => tmpImageList.add(item);
  void removeFromTmpImageList(FFUploadedFile item) => tmpImageList.remove(item);
  void removeAtIndexFromTmpImageList(int index) => tmpImageList.removeAt(index);
  void insertAtIndexInTmpImageList(int index, FFUploadedFile item) =>
      tmpImageList.insert(index, item);
  void updateTmpImageListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpImageList[index] = updateFn(tmpImageList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

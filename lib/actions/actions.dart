import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/confirm_custom_view/confirm_custom_view_widget.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future<bool?> confirmBlock(
  BuildContext context, {
  required String? title,
  String? detail,
}) async {
  bool? isConfirm;

  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: ConfirmCustomViewWidget(
            title: title!,
            detail: detail,
          ),
        ),
      );
    },
  ).then((value) => isConfirm = value);

  if ((isConfirm != null) && isConfirm!) {
    return true;
  }

  return false;
}

Future clearPref(BuildContext context) async {
  FFAppState().customerReference = null;
  FFAppState().currentDropdownSelected = CurrentDropdownSelectedDataStruct();
  FFAppState().buildingList = [];
}

Future checkAppVersion(BuildContext context) async {
  ConfigRecord? configResult;

  configResult = await queryConfigRecordOnce(
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  await actions.setAppVersion();
  if (FFAppState().appBuildVersion < configResult!.storeVersion) {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: WebViewAware(
            child: InfoCustomViewWidget(
              title: 'กรุณาอัพเดทแอปพลิเคชั่นและเปิดใหม่อีกครั้ง',
              status: 'error',
            ),
          ),
        );
      },
    );

    if (isAndroid) {
      await launchURL(configResult!.storeAndroidLink);
    } else {
      await launchURL(configResult!.storeIosLink);
    }

    await actions.closeApp();
  }
}

import '/component/confirm_custom_view/confirm_custom_view_widget.dart';
import 'package:flutter/material.dart';

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
            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: ConfirmCustomViewWidget(
          title: title!,
          detail: detail,
        ),
      );
    },
  ).then((value) => isConfirm = value);

  if ((isConfirm != null) && isConfirm!) {
    return true;
  }

  return false;
}

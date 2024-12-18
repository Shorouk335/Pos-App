import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future showDialogConfirmDeleteSalesItem(
    BuildContext context, String typeDelete, void Function()? onDeletePressed) {
  return showDialog(
      context: context,
      barrierDismissible: false,

      builder: (BuildContext context) {
        return AlertDialog(

          title: CustomText(context: context,
            text: "d_$typeDelete".tr(),
            isWeight: true,
            size: 22.0,
          ),
          content: CustomText(context: context,text: "d_disc_$typeDelete".tr()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: CustomText(context: context,
                text: "cancel".tr(),
                type: TextType.big,
                isWeight: true,
              ),
            ),
            TextButton(
              onPressed: () {
                onDeletePressed!.call();
                Navigator.of(context).pop();
              },
              child: CustomText(context: context,
                text: "DELETE".tr(),
                 isWeight: true,
                type: TextType.big,
              ),
            ),
          ],
        );
      });
}

import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future showCancelChangedAddSalesItemDialog(
    BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,

      builder: (BuildContext context) {
        return AlertDialog( 
           actionsAlignment: MainAxisAlignment.spaceBetween,
           actionsPadding:  const EdgeInsets.symmetric(vertical: 15.0 , horizontal: 5.0),
          title: CustomText(context: context,
            text: "unsaved_changes".tr(),
            isWeight: true,
            size: 22.0,
          ),
          content: CustomText(context: context,text: "unsaved_changes_disc".tr()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: CustomText(context: context,
                text: "continue_editing".tr(),
                  size: 16,
                 type: TextType.big,
                isWeight: true,
              ),
            ),
            TextButton(
              onPressed: () {
               
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: CustomText(context: context,
                text: "discard_changes".tr(),
                 isWeight: true,
                 size: 16,
                 type: TextType.big,
               
              ),
            ),
          ],
        );
      });
}

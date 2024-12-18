import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

abstract class DropDownItem {
  static List<DropdownMenuItem<int>> paymentItem(BuildContext context,
      {bool isIgnore = false}) {
    return [
      DropdownMenuItem(
        value: 0,
        child: CustomText(
          context: context,
          text: "Cash",
          color: isIgnore ? AppColors.greyBorder : null,
        ),
      ),
      DropdownMenuItem(
          value: 1,
          child: CustomText(
            context: context,
            text: "Card",
            color: isIgnore ? AppColors.greyBorder : null,
          )),
    ];
  }
}

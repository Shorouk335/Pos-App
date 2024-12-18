import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class CalculateButtonWidget extends StatelessWidget {
  const CalculateButtonWidget(
      {super.key, this.text, required this.onTap, this.isOkButton = false});
  final String? text;
  final void Function()? onTap;
  final bool isOkButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: isOkButton
                  ? AppColors.primary(context)
                  : Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkColor
                      : Colors.grey.shade500),
          child: CustomText(
            context: context,
            text: text ?? "",
            size: 35.0,
            color: Colors.white,
          )),
    );
  }
}

class CalculateClearButtonWidget extends StatelessWidget {
  const CalculateClearButtonWidget({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color:  Theme.of(context).brightness == Brightness.dark  ? AppColors.darkColor : Color(0xff736F6E)),
          child: Icon(
            Icons.backspace_outlined,
            color: Colors.white70,
            size: 40.0,
          )),
    );
  }
}

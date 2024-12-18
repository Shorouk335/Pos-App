import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// icon + text
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.radius , 
      this.textSize
      });
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final double? iconSize;
  final double? height;
  final Color? backgroundColor;
  final double? radius;
  final double? textSize;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 70.0,
      
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 10.0)))),
              padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 0.0)),
              backgroundColor: WidgetStateProperty.all(
                  backgroundColor ?? AppColors.onPrimary(context))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
              if (icon != null)
                const SizedBox(
                  width: 10,
                ),
              CustomText(context: context,
                text: text,
                type: TextType.textButton,
                color: textColor ?? AppColors.buttonTextColor(context),
                size: textSize,
              )
            ],
          )),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.radius,
      this.radiusColor , 
      this.textSize});
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final Color? radiusColor;
  final double? iconSize;
  final double? height;
  final Color? backgroundColor;
  final double? radius;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 70.0,
      child: ElevatedButton(
          style: ButtonStyle(
              side: WidgetStateProperty.all<BorderSide>(BorderSide(
                color: radiusColor ?? AppColors.onPrimary(context),
                
              )),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(radius ?? 10.0)))),
              padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 0.0)),
              backgroundColor: WidgetStateProperty.all(
                  backgroundColor ?? AppColors.backgroundColorMode(context))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
              if (icon != null)
                const SizedBox(
                  width: 10,
                ),
              CustomText(context: context,
                text: text,
                color: textColor ?? AppColors.onPrimary(context),
                size: textSize,
              )
            ],
          )),
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum TextType { big, title, description, textButton, normal }

TextStyle getTextStyle(BuildContext context, TextType type,
    {Color? color, bool isWeight = false, double? size}) {
  switch (type) {
    case TextType.big:
      return TextStyle(
        fontSize: size ?? 20,
        color: color ?? AppColors.primary(context),
        fontWeight: isWeight ? FontWeight.w700 : FontWeight.normal,
      );

    case TextType.title:
      return TextStyle(
          fontSize: size ?? 18,
          color: color ?? AppColors.textNormalColor(context),
          fontWeight: isWeight ? FontWeight.bold : FontWeight.normal);

    case TextType.description:
      return TextStyle(
          fontSize: size ?? 15,
          color: color ?? AppColors.hintText(context),
          fontWeight: isWeight ? FontWeight.bold : FontWeight.normal);

    case TextType.textButton:
      return TextStyle(
          fontSize: size ?? 20,
          color: color ?? Colors.white,
          fontWeight: isWeight ? FontWeight.bold : FontWeight.normal);

    default:
      return TextStyle(
          fontSize: size ?? 18,
          color: color ?? AppColors.textNormalColor(context),
          fontWeight: isWeight ? FontWeight.bold : FontWeight.normal);
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.type,
      this.color,
      this.isWeight = false,
      this.size,
      this.overflow,
      this.textAlign,
      required this.context});
  final String text;
  final TextType? type;
  final Color? color;
  final bool isWeight;
  final double? size;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        textAlign: textAlign,
        style: getTextStyle(
          context,
          type ?? TextType.normal,
          color: color,
          isWeight: isWeight,
          size: size,
        ));
  }
}

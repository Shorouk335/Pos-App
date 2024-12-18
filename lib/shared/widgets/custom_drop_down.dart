import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String hint;
  final Function(int?) onChanged;
  final int? value;
  final List<DropdownMenuItem<int>>? items;
  final String? Function(int?)? validator;
  final EdgeInsetsGeometry? padding;
  final bool isIgnore;
  final bool withoutBorder;
  const CustomDropDown(
      {super.key,
      required this.hint,
      required this.onChanged,
      required this.value,
      required this.items,
      this.validator,
      this.padding,
      this.isIgnore = false,
      this.withoutBorder = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField<int>(
        padding: padding,
        isExpanded: true,
        value: value,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: withoutBorder
                  ? BorderSide.none
                  : BorderSide(
                      color: isIgnore
                          ? AppColors.greyBorder
                          : AppColors.normalTextGrey(context)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: withoutBorder
                  ? BorderSide.none
                  : BorderSide(
                      color: isIgnore
                          ? AppColors.greyBorder
                          : AppColors.normalTextGrey(context)),
            ),
            border: UnderlineInputBorder(
              borderSide: withoutBorder
                  ? BorderSide.none
                  : BorderSide(
                      color: isIgnore
                          ? AppColors.greyBorder
                          : AppColors.normalTextGrey(context),
                    ),
            )),
        hint: CustomText(context: context,
          text: hint,
          color: isIgnore ? AppColors.greyBorder : AppColors.normalTextGrey(context),
          size: 18.0,
        ),
        iconEnabledColor:
            isIgnore ? AppColors.greyBorder : AppColors.normalTextGrey(context),
        iconDisabledColor:
            isIgnore ? AppColors.greyBorder : AppColors.normalTextGrey(context),
        focusColor: AppColors.backgroundColorMode(context),
        items: items,
        onChanged: onChanged,
        dropdownColor: AppColors.backgroundColorMode(context),
      ),
    );
  }
}

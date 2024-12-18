import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CircularCheckBox extends StatelessWidget {
  const CircularCheckBox({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? AppColors.primary(context) : AppColors.normalTextGrey(context)),
      ),
      child: isSelected
          ? Container(
              padding: const EdgeInsets.all(5.0),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary(context),
              ))
          : null,
    );
  }
}

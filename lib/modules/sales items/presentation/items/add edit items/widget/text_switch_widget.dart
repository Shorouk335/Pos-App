import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class TextSwitchWidget extends StatelessWidget {
  const TextSwitchWidget(
      {super.key,
      required this.title,
      required this.isClickSwitch,
      required this.onChanged});
  final String title;
  final bool isClickSwitch;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          context: context,
          text: title,
        ),
        const Spacer(),
        Switch(
            value: isClickSwitch,
            activeColor: AppColors.primary(context),
            inactiveTrackColor: Colors.grey.shade300,
            inactiveThumbColor: Colors.grey.shade400,
            splashRadius: 0.0,
            trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.transparent;
              }
              return Colors.transparent;
            }),
            onChanged: onChanged)
      ],
    );
  }
}

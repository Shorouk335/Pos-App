import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/circle_check_ticket.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class SortByItemWidget extends StatelessWidget {
  const SortByItemWidget(
      {super.key,
      required this.title,
      this.isSelected = false,
      required this.onTap});
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularCheckBox(isSelected: isSelected),
          const SizedBox(
            width: 15.0,
          ),
          CustomText(context: context,
            text: title,
            size: 18.0,
          ),
        ],
      ),
    );
  }
}

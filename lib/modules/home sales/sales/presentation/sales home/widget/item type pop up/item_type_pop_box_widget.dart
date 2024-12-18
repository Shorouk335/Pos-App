import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class ItemTypeBoxPopWidget extends StatelessWidget {
  const ItemTypeBoxPopWidget(
      {super.key,
      required this.title,
      this.isSelected = false,
      required this.onTap});
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        color: isSelected ? Colors.grey.withOpacity(0.1) : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomText(
                context: context,
                text: title,
                size: 18.0,
              ),
            ),
            const Expanded(child: Text("                 ")),
          ],
        ),
      ),
    );
  }
}

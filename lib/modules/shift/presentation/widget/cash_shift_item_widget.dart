import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class CashShiftItemWidget extends StatelessWidget {
  const CashShiftItemWidget(
      {super.key,
      required this.title,
      required this.amount,
      this.isWeight = false});
  final String? title;
  final String? amount;
  final bool isWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(context: context,
            text: title ?? "",
            isWeight: isWeight,
          ),
          CustomText(context: context,
            text: amount ?? "",
            isWeight: isWeight,
          ),
        ],
      ),
    );
  }
}

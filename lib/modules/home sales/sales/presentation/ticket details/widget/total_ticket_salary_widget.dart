import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class TotalTicketSalaryWidget extends StatelessWidget {
  const TotalTicketSalaryWidget({super.key, required this.title , required this.value});
  final String title;
  final String value ; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(context: context,
            text: title,
            isWeight: true,
          ),
          CustomText(context: context,
            text: value,
            isWeight: true,
          ),
        ],
      ),
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class ReceiptsHeaderWidget extends StatelessWidget {
  const ReceiptsHeaderWidget({super.key , required this.history});
  final String history ; 

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColorMode(context),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomText(context: context,text: "Thursday May $history" , type: TextType.big ),
          ),
          const Divider()
        ],
      ),
    ) ; 
  }
}
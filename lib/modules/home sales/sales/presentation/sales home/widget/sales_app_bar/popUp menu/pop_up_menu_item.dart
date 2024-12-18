import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class PopUpMenuItemTicketWidget extends StatelessWidget {
  const PopUpMenuItemTicketWidget(
      {super.key, required this.iconData, required this.title , this.isIgnoring = false , required this.onTap});
  final IconData iconData;
  final String title;
  final bool isIgnoring ; 
  final void Function()? onTap ; 

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isIgnoring,
      child: InkWell(
        onTap:onTap ,
        child: Row(  
          mainAxisSize: MainAxisSize.min,
        
          children: [
            Icon(
              iconData,
              color:isIgnoring ? Colors.grey.withOpacity(0.5) : AppColors.normalTextGrey(context),
              size: 25.0,
            ),
            const SizedBox(width: 15.0,) , 
            CustomText(context: context,
              text: title,
              color:isIgnoring ?Colors.grey.withOpacity(0.5) : AppColors.normalTextGrey(context),
              size: 18.0,
            ),
          ],
        ),
      ),
    );
  }
}

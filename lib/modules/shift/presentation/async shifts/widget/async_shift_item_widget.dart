import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class AsyncShiftItemWidget extends StatelessWidget {
  const AsyncShiftItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.pushNamed(AppRouter.reportShiftRoute);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.greyBorder,
          radius: 25.0,
          child:  Icon(
            Icons.schedule,
            color:AppColors.normalTextGrey(context),
          ),
        ),
        title:  Column(
          children: [
            Row(
              children: [
                CustomText(context: context,text: "OCT 22"),
                CustomText(context: context,text: " - "),
                CustomText(context: context,text: "OCT 29"),
              ],
            ),
            Row(
              children: [
                CustomText(context: context,text: "9:00 Am" , type: TextType.description,),
                CustomText(context: context,text: " - " ,type: TextType.description),
                CustomText(context: context,text: "5:00 Pm" , type: TextType.description),
              ],
            )
          ],
        ),
      ),
    );
  }
}

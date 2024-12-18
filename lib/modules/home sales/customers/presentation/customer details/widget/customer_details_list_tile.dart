import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomerDetailsListTileWidget extends StatelessWidget {
  const CustomerDetailsListTileWidget({super.key , required this.title , required this.icon , required this.disc});
  final String title ; 
  final String disc ; 
  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return ListTile( 
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
      leading: Icon(icon ,color: AppColors.normalTextGrey(context),size: 30.0,) ,
      minLeadingWidth: 40.0,
      title: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          CustomText(context: context,text: title)  , 
          CustomText(context: context,text: disc , type: TextType.description,)  , 

        ],
      )
    );
  }
}
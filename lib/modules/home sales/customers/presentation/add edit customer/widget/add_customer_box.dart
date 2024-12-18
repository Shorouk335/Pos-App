import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:flutter/material.dart';

class AddCustomerListTileWidget extends StatelessWidget {
  const AddCustomerListTileWidget({super.key , required this.title , this.icon});
  final String title ; 
  final IconData? icon ;

  @override
  Widget build(BuildContext context) {
    return ListTile( 
      contentPadding: EdgeInsets.zero,
      leading: icon!= null ? Icon(icon ,color: AppColors.normalTextGrey(context),size: 30.0,) : const SizedBox(width: 30.0,),
      minLeadingWidth: 40.0,
      title: CustomTextFormField(
       labelText: title,
       labelStyle:   TextStyle(fontSize: 20.0 , color: AppColors.normalTextGrey(context)),
       contentPadding: EdgeInsets.zero,
      // textStyle: const TextStyle(fontSize: 18.0),


       

      ) ,
    );
  }
}
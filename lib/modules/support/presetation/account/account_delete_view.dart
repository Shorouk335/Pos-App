import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AccountDeleteView extends StatelessWidget {
  const AccountDeleteView({super.key});

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: CustomDarkAppBar(
        title: "account".tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            InkWell(
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(context: context,text: "delete_account".tr() , isWeight: true ,) , 
                  const SizedBox(height: 5.0,) , 
                  CustomText(context: context,text:"permanently_delete_your_pos_account_and_all_its_data".tr() , type: TextType.description
                  ,) , 

                ],
              ),
            )
            
          ],
        ),
      ) ,
    ); 
  }
}
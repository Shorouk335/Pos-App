import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/receipts/presentation/receipts_view.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SalesItemWidget extends StatelessWidget {
  const SalesItemWidget(
      {super.key, required this.onTap, required this.icon , required this.title});
  final void Function()? onTap;
  final String title ; 
  final IconData icon ; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Row(
        children: [ 
           const SizedBox(
            width: 20.0,
          ),
           Icon(
            icon,
            size: 30,
            color: AppColors.normalTextGrey(context),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: IntrinsicWidth(
              child: Container( 
                padding: const EdgeInsets.symmetric(vertical: 5.0 ),
               
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomText(context: context,text: title.tr()),
                )
              ),
            ),
          ) , 
        
        ],
      ),
    )  ;
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditFavoriteButtonWidget extends StatelessWidget {
  const EditFavoriteButtonWidget({super.key , required this.onTap});
  final void Function()? onTap ; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 15.0),
      child: InkWell(
        onTap: onTap , 
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit , color: AppColors.primary(context), size: 25.0,) , 
            SizedBox(width: 15.0,) , 
            CustomText(text: "edit_favorite".tr(),
             context: context , type: TextType.big,)
          ],
        ),
      ),
    );
  }
}
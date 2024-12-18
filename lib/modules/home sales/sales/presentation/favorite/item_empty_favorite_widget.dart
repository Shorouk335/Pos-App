import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemEmptyFavoriteWidget extends StatelessWidget {
  const ItemEmptyFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                context: context,
                text: "add_favorite_text".tr(),
                type: TextType.description,
                size: 18 ,
                textAlign: TextAlign.center,
              ),
           
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0 , horizontal: 50.0),
                child: CustomButton(
                  radius: 0.0,
                  
                  onPressed: () {
                    NavigationService.pushNamed(AppRouter.editFavoriteItemRoute);
                  }, text: "edit_favorite".tr()),
              )
            ],
          );
  }
}
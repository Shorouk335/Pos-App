import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/widget/items_pop_up_menu.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SaveFavoriteItemBox extends StatelessWidget {
  const SaveFavoriteItemBox({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundGray(context),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: InkWell(
                onTap: onTap,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.primary(context)),
                  child: Center(
                    child: CustomText(
                      text: "save".tr(),
                      context: context,
                      type: TextType.textButton,
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

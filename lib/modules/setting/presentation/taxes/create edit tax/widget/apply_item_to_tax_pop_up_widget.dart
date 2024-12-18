import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ApplyItemsToTaxPopUpWidget extends StatelessWidget {
  const ApplyItemsToTaxPopUpWidget({
    super.key,
    required this.onClearSelectionsTap , 
    required this.onSelectAllTap
  });
  final void Function()? onSelectAllTap ; 
  final void Function()? onClearSelectionsTap ; 

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<String>(
          iconColor: AppColors.textNormalColor(context),
          color: AppColors.backgroundColorMode(context),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
          padding: const EdgeInsets.all(10.0),
          value: "select_all",
          child: InkWell(
            onTap: onSelectAllTap , 
            child: SizedBox( 
              width: double.infinity,
              child: CustomText(context: context,
                text: "select_all".tr(),
                size: 18.0,
              ),
            ),
          ),
        ),
            PopupMenuItem<String>(
          padding: const EdgeInsets.all(10.0),
          value: "clear_selection",
          child: InkWell(
            onTap: onClearSelectionsTap , 
            child: SizedBox(
              width: double.infinity,
              child: CustomText(context: context,
                text: "clear_selection".tr(),
                size: 18.0,
              ),
            ),
          ),
        ),
            
          ],
        );
     
  }
}

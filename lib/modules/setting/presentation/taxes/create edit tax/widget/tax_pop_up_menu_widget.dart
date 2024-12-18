import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TaxPopUpMenuWidget extends StatefulWidget {
  const TaxPopUpMenuWidget({
    super.key,
  });

  @override
  State<TaxPopUpMenuWidget> createState() => _TicketTypePopUpWidgetState();
}

class _TicketTypePopUpWidgetState extends State<TaxPopUpMenuWidget> {
  
  String selectedItem = "included_in_the_price".tr();

  changeSelectedItem(String item) {
    setState(() {
      selectedItem = item;
    });
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      iconColor: AppColors.normalTextGrey(context),
      padding: EdgeInsets.zero,
      color: AppColors.backgroundColorMode(context),
      constraints:  BoxConstraints(maxHeight: MediaQuery.of(context).size.height/3.2),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          padding: const EdgeInsets.all(10.0),
          value: "included_in_the_price",
          child: InkWell(
            onTap: () {
              changeSelectedItem("included_in_the_price".tr());
            },
            child: CustomText(context: context,
              text: "included_in_the_price".tr(),
              size: 18.0,
            ),
          ),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.all(10.0),
          value: "added_in_the_price",
          child: InkWell(
            onTap: () {
              changeSelectedItem("added_in_the_price".tr());
            },
            child: CustomText(context: context,
              text: "added_in_the_price".tr(),
              size: 18.0,
            ),
          ),
        ),
      
      ],
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(context: context,
                text: selectedItem,
              
              ),
              const Spacer(), 
              const Icon(
                Icons.arrow_drop_down_sharp,
              
              )
            ],
          ),
           Divider(color: AppColors.normalTextGrey(context),), 
        ],
      ),
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemsPopUpMenuWidget extends StatefulWidget {
  const ItemsPopUpMenuWidget({
    super.key,
  });

  @override
  State<ItemsPopUpMenuWidget> createState() => _TicketTypePopUpWidgetState();
}

class _TicketTypePopUpWidgetState extends State<ItemsPopUpMenuWidget> {
  String selectedItem = "all_items".tr();

  changeSelectedItem(String item) {
    setState(() {
      selectedItem = item;
    });
    Navigator.pop(context);
  }
// to list of categories
  List<PopupMenuItem<String>> categoriesList() => List.generate(3, (index) {
        return PopupMenuItem<String>(
          padding: const EdgeInsets.all(10.0),
          value: "category ${index+1}",
          child: InkWell(
            onTap: () {
              changeSelectedItem("category ${index+1}");
            },
            child: CustomText(context: context,
              text: "category ${index+1}",
              size: 18.0,
            ),
          ),
        );
      });

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
          value: "all_items",
          child: InkWell(
            onTap: () {
              changeSelectedItem("all_items".tr());
            },
            child: CustomText(context: context,
              text: "all_items".tr(),
              size: 18.0,
            ),
          ),
        ),
        ...categoriesList()
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(context: context,
            text: selectedItem,
            type: TextType.textButton,
          ),
           Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

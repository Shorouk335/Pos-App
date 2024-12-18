import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrinterModelPopUpWidget extends StatefulWidget {
  const PrinterModelPopUpWidget({
    super.key,
  });

  @override
  State<PrinterModelPopUpWidget> createState() => _TicketTypePopUpWidgetState();
}

class _TicketTypePopUpWidgetState extends State<PrinterModelPopUpWidget> {
  
  String selectedItem = "No printer".tr();

  changeSelectedItem(String item) {
    setState(() {
      selectedItem = item;
    });
    Navigator.pop(context);
  }
// to list of printer model
  List<PopupMenuItem<String>> printerModelsList() => List.generate(10, (index) {
        return PopupMenuItem<String>(
          padding: const EdgeInsets.all(10.0),
          value: "printer ${index+1}",
          child: InkWell(
            onTap: () {
              changeSelectedItem("printer ${index+1}");
            },
            child: CustomText(context: context,
              text: "printer ${index+1}",
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
          value: "No printer",
          child: InkWell(
            onTap: () {
              changeSelectedItem("No printer".tr());
            },
            child: CustomText(context: context,
              text: "No printer".tr(),
              size: 18.0,
            ),
          ),
        ),
        ...printerModelsList()
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

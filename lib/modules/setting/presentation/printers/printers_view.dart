import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/floating_sales_item_widget.dart';
import 'package:e_ticket_app/modules/setting/domain/model/setting_item_model.dart';
import 'package:e_ticket_app/modules/setting/presentation/printers/widget/printer_app_bar_widget.dart';
import 'package:e_ticket_app/modules/setting/presentation/widget/empty_setting_type_widget.dart';
import 'package:e_ticket_app/modules/setting/presentation/widget/setting_item_list_widget.dart';
import 'package:e_ticket_app/shared/widgets/loadingAndError.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrintersView extends StatefulWidget {
  const PrintersView({super.key});

  @override
  State<PrintersView> createState() => _PrintersViewState();
}

class _PrintersViewState extends State<PrintersView> {
  ///////////logic for try only  /////////////
    
  List<SettingItemModel> printerList = [
    SettingItemModel(name: "print 1", isSelected: false),
    SettingItemModel(name: "print2", isSelected: false),
  ];

  selectPrintOrNot(SettingItemModel item) {
    setState(() {
      item.isSelected = !item.isSelected!;
    });
  }

  deletePrinters() {
    printerList.removeWhere((item) => item.isSelected == true);
    setState(() {});
  }

  int getNumberOfSelectedPrint() {
    int count = 0;
    for (int i = 0; i < printerList.length; i++) {
      if (printerList[i].isSelected == true) {
        count++;
      }
    }
    return count;
  }

  bool isSelectedOrNotPrint() {
    return printerList.any((element) => element.isSelected == true);
  }

  removeSelectMode() {
    for (var element in printerList) {
      element.isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SettingAppBar( 
          typeName: getNumberOfSelectedPrint() == 1 ? "printer" : "printers",
          isNormalAppBar: isSelectedOrNotPrint(),
          count: getNumberOfSelectedPrint(),
          onDeletePressed: deletePrinters,
          onBackPressed: removeSelectMode, 
          title: 'printers'.tr(),
        ),
        body: LoadingAndError(
            isLoading: false,
            isError: printerList.isEmpty,
            errorWidget: const EmptySettingTypeWidget(
              settingType: SettingType.printers,
            ),
            child: ListView.builder(
                itemCount: printerList.length,
                itemBuilder: (context, index) {
                  return SettingItemListWidget(
                    settingItemModel:printerList[index] ,
                     onLongPress: (){
                      selectPrintOrNot(printerList[index]);
                     },
                      iconData: Icons.print,
                       nextRoute: AppRouter.createEditEditPrintersSettingRoute); 
                })),
        floatingActionButton: FloatingItemsAndSettingItemWidget(
          onPressed: () {
            NavigationService.pushNamed(AppRouter.createEditEditPrintersSettingRoute);
          },
        ));
  }
}
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

class TaxesView extends StatefulWidget {
  const TaxesView({super.key});

  @override
  State<TaxesView> createState() => _TaxesViewState();
}

class _TaxesViewState extends State<TaxesView> {
  ///////////logic for try only  /////////////

  List<SettingItemModel> taxesList = [
    SettingItemModel(name: "tax 1", isSelected: false),
    SettingItemModel(name: "tax 2", isSelected: false),
  ];

  selectTaxOrNot(SettingItemModel item) {
    setState(() {
      item.isSelected = !item.isSelected!;
    });
  }

  deleteTaxes() {
    taxesList.removeWhere((item) => item.isSelected == true);
    setState(() {});
  }

  int getNumberOfSelectedTax() {
    int count = 0;
    for (int i = 0; i < taxesList.length; i++) {
      if (taxesList[i].isSelected == true) {
        count++;
      }
    }
    return count;
  }

  bool isSelectedOrNotTax() {
    return taxesList.any((element) => element.isSelected == true);
  }

  removeSelectMode() {
    for (var element in taxesList) {
      element.isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(
        typeName: getNumberOfSelectedTax() == 1 ? "tax" : "taxes",
        isNormalAppBar: isSelectedOrNotTax(),
        count: getNumberOfSelectedTax(),
        onDeletePressed: deleteTaxes,
        onBackPressed: removeSelectMode,
        title: 'taxes'.tr(),
      ),
      body: LoadingAndError(
          isLoading: false,
          isError: taxesList.isEmpty,
          errorWidget: const EmptySettingTypeWidget(
            settingType: SettingType.taxes,
          ),
          child: ListView.builder(
              itemCount: taxesList.length,
              itemBuilder: (context, index) {
                return SettingItemListWidget(
                    settingItemModel: taxesList[index],
                    //  onLongPress: (){
                    //   selectTaxOrNot(taxesList[index]);
                    //  },
                    iconData: Icons.percent);
                //  nextRoute: AppRouter.createEditTaxesSettingRoute);
              })),
      // floatingActionButton: FloatingItemsAndSettingItemWidget(
      //   onPressed: () {
      //     NavigationService.pushNamed(AppRouter.createEditTaxesSettingRoute);
      //   },
      // )
    );
  }
}

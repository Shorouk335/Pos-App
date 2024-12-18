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

class CustomerDisplaysView extends StatefulWidget {
  const CustomerDisplaysView({super.key});

  @override
  State<CustomerDisplaysView> createState() => _CustomerDisplaysViewState();
}

class _CustomerDisplaysViewState extends State<CustomerDisplaysView> {
  ///////////logic for try only  /////////////
    
  List<SettingItemModel> customerDisplayList = [
    SettingItemModel(name: "display 1", isSelected: false),
    SettingItemModel(name: "display 2", isSelected: false),
  ];

  selectCustomerDisplayOrNot(SettingItemModel item) {
    setState(() {
      item.isSelected = !item.isSelected!;
    });
  }

  deleteCustomerDisplays() {
    customerDisplayList.removeWhere((item) => item.isSelected == true);
    setState(() {});
  }

  int getNumberOfSelectedCustomerDisplay() {
    int count = 0;
    for (int i = 0; i < customerDisplayList.length; i++) {
      if (customerDisplayList[i].isSelected == true) {
        count++;
      }
    }
    return count;
  }

  bool isSelectedOrNotCustomerDisplay() {
    return customerDisplayList.any((element) => element.isSelected == true);
  }

  removeSelectMode() {
    for (var element in customerDisplayList) {
      element.isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SettingAppBar( 
          typeName: getNumberOfSelectedCustomerDisplay() == 1 ? "customer_display" : "customer_displays",
          isNormalAppBar: isSelectedOrNotCustomerDisplay(),
          count: getNumberOfSelectedCustomerDisplay(),
          onDeletePressed: deleteCustomerDisplays,
          onBackPressed: removeSelectMode, 
          title: 'customer_display'.tr(),
        ),
        body: LoadingAndError(
            isLoading: false,
            isError: customerDisplayList.isEmpty,
            errorWidget: const EmptySettingTypeWidget(
              settingType: SettingType.customerDisplay,
            ),
            child: ListView.builder(
                itemCount: customerDisplayList.length,
                itemBuilder: (context, index) {
                  return SettingItemListWidget(
                    settingItemModel:customerDisplayList[index] ,
                     onLongPress: (){
                      selectCustomerDisplayOrNot(customerDisplayList[index]);
                     },
                      iconData: Icons.tv,
                       nextRoute: AppRouter.createEditCustomerDisplaysRoute); 
                })),
        floatingActionButton: FloatingItemsAndSettingItemWidget(
          onPressed: () {
            NavigationService.pushNamed(AppRouter.createEditCustomerDisplaysRoute);
          },
        ));
  }
}
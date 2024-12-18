import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SalesItemsView extends StatefulWidget {
  const SalesItemsView({super.key});

  @override
  State<SalesItemsView> createState() => _SalesItemsViewState();
}

class _SalesItemsViewState extends State<SalesItemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDrawerAppBar(
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
          title: "items".tr()),
      body: Column(
        children: [ 
          SalesItemWidget(onTap: (){
            NavigationService.pushNamed(AppRouter.itemsRoute); 
          }, icon: Icons.list, title: "items") , 
          const SizedBox(height: 15.0,) , 
          // category
          // SalesItemWidget(onTap: (){NavigationService.pushNamed(AppRouter.categoriesRoute); }, icon: Icons.filter_none, title: "categories") , 
          // const SizedBox(height: 15.0,) , 
          // // modifiers
          // SalesItemWidget(onTap: (){NavigationService.pushNamed(AppRouter.modifiersRoute); }, icon: Icons.task_outlined, title: "modifiers") , 
          // const SizedBox(height: 15.0,) , 
          SalesItemWidget(onTap: (){NavigationService.pushNamed(AppRouter.discountsRoute); }, icon: Icons.discount_outlined, title: "discounts") , 
          const SizedBox(height: 15.0,) , 

        ],
      ),
    );
  }
}

import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDrawerAppBar(
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
          title: "settings".tr()),
      body: Column(
        children: [
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.printersSettingRoute);
              },
              icon: Icons.print,
              title: "printers"),
          const SizedBox(
            height: 15.0,
          ),
          //customer_display
          // SalesItemWidget(
          //     onTap: () {
          //       NavigationService.pushNamed(AppRouter.customerDisplaysRoute);
          //     },
          //     icon: Icons.tv,
          //     title: "customer_display"),
          // const SizedBox(
          //   height: 15.0,
          // ),
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.taxesSettingRoute);
              },
              icon: Icons.percent,
              title: "taxes"),
          const SizedBox(
            height: 15.0,
          ),
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.generalSettingRoute);
              },
              icon: Icons.settings,
              title: "general"),
          const SizedBox(
            height: 15.0,
          ),
          const Spacer() , 
           CustomText(context: context,text: "useremail@gmail.com") ,
         
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomOutlineButton(
                    radius: 0.0, 
                    textColor: AppColors.textNormalColor(context),
                    backgroundColor:AppColors.buttonBackGroundLight(context) ,
                    radiusColor: Colors.grey,
                    onPressed: () {   
                      HiveService.deleteUserModel();
                      NavigationService.goNamed(AppRouter.splachRoute);
                    }, text: "sign_out".tr()),
          ),
          

        ],
      ),
    );
  }
}

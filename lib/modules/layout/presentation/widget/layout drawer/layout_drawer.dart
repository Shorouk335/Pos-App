import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/layout/presentation/widget/layout%20drawer/layout_drawer_header.dart';
import 'package:e_ticket_app/modules/layout/presentation/widget/layout%20drawer/layout_drawer_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LayoutDrawerWidget extends StatelessWidget {
  const LayoutDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColorMode(context),
      shape: const RoundedRectangleBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.primary(context)
                    : AppColors.darkColor,
              ),
              child: LayoutDrawerHeaderWidget()),
          LayoutDrawerItemWidget(
            index: 0,
            title: "sales".tr(),
            icon: Icons.shopping_basket_outlined,
          ),
          LayoutDrawerItemWidget(
            index: 1,
            title: "receipts".tr(),
            icon: Icons.receipt_outlined,
          ),
          LayoutDrawerItemWidget(
            index: 2,
            title: "shift".tr(),
            icon: Icons.schedule,
          ),
          LayoutDrawerItemWidget(
            index: 3,
            title: "items".tr(),
            icon: Icons.list,
          ),
          LayoutDrawerItemWidget(
            index: 4,
            title: "settings".tr(),
            icon: Icons.settings,
          ),
          const Divider(),
          LayoutDrawerItemWidget(
            index: -1,
            title: "back_office".tr(),
            icon: Icons.bar_chart,
          ),
          LayoutDrawerItemWidget(
            index: 5,
            title: "apps".tr(),
            isSvgIcon: true,
            svgIcon: "sigma",
          ),
          LayoutDrawerItemWidget(
            index: 6,
            title: "support".tr(),
            icon: Icons.error_outline,
          ),
        ],
      ),
    );
  }
}

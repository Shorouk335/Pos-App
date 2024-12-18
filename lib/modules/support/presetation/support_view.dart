import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDrawerAppBar(
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
          title: "support".tr()),
      body: Column(
        children: [
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.helpRoute);
              },
              icon: Icons.help_outline,
              title: "help"),
          const SizedBox(
            height: 15.0,
          ),
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.legalInformationRoute);
              },
              icon: Icons.gpp_maybe_outlined
,
              title: "legal_information"),
          const SizedBox(
            height: 15.0,
          ),
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.accountRoute);
              },
              icon: Icons.account_circle_outlined,
              title: "account"),
        ],
      ),
    );
  }
}

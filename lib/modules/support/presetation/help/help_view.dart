import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(title: "help".tr()),
      body: Column(
        children: [
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.webPageRoute);
              },
              icon: Icons.help,
              title: "help_center"),
          const SizedBox(
            height: 15.0,
          ),
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.webPageRoute);
              },
              icon: Icons.forum,
              title: "community"),
        ],
      ),
    );
  }
}

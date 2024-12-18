import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LegalInformationView extends StatelessWidget {
  const LegalInformationView
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(title: "legal_information".tr()),
      body: Column(
        children: [
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.webPageRoute);
              },
              icon: Icons.description,
              title: "terms_of_use"),
          const SizedBox(
            height: 15.0,
          ),
          SalesItemWidget(
              onTap: () {
                NavigationService.pushNamed(AppRouter.webPageRoute);
              },
              icon: Icons.policy,
              title: "privacy_police"),
        ],
      ),
    );
  }
}
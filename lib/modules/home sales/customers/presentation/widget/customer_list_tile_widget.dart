import 'dart:developer';

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomerListTileWidget extends StatelessWidget {
  const CustomerListTileWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.pushNamed(
          AppRouter.customerDetailsRoute,
        ).then((value) {
          if (value == true) {
            NavigationService.popPage();
          }
        });
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading:  Icon(
          Icons.account_circle,
          color: AppColors.normalTextGrey(context),
          size: 50.0,
        ),
        title: CustomText(context: context,text: name),
      ),
    );
  }
}

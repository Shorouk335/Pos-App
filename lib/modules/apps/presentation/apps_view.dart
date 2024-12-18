import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/apps/presentation/widget/apps_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppsView extends StatelessWidget {
  const AppsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray(context),
        appBar: CustomDrawerAppBar(
            onMenuPressed: () {
              Scaffold.of(context).openDrawer();
            },
            title: "apps".tr()),
        body: ListView(
          children: [
           AppsItemWidget(img: "hr_logo", title: "Hr Infosas", disc: "it is application for self service to company ",url: "",), 
           SizedBox(height: 15.0,) , 
          ],
        ));
  }
}

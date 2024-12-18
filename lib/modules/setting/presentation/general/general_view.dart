import 'package:e_ticket_app/core/data_service/PrefService/prefService.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/main.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/text_switch_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GeneralView extends StatefulWidget {
  const GeneralView({super.key});

  @override
  State<GeneralView> createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {
  late bool isDarkModel;
  @override
  void initState() {
    super.initState();
    isDarkModel = PrefService.appTheme == "dark" ? true : false ; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: CustomDarkAppBar(
        title: "general".tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSwitchWidget(
                title: "use_camera_to_scan_barcodes".tr(),
                isClickSwitch: false,
                onChanged: (value) {}),
            const SizedBox(
              height: 15.0,
            ),
            TextSwitchWidget(
                title: "dark_theme".tr(),
                isClickSwitch: isDarkModel,
                onChanged: (value) {
                  setState(() {
                    isDarkModel = value;
                    if (value == true) {
                      ETicketApp.of(context)!.changeTheme(ThemeMode.dark);
                    } else {
                      ETicketApp.of(context)!.changeTheme(ThemeMode.light);
                    }
                    PrefService.appTheme = value ? "dark" : "light";
                  });
                }),
            const SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: () {
                NavigationService.pushNamed(
                        AppRouter.changeHomeScreenLayoutSettingRoute)
                    .then((value) {
                  if (value == "save") {
                    setState(() {});
                  }
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(context: context,text: "home_screen_item_layout".tr()),
                  CustomText(context: context,
                    text: PrefService.itemStyle.isEmpty ? "list".tr() : PrefService.itemStyle.tr() ,
                    type: TextType.description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

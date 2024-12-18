import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/shift/presentation/open%20shift/open_shift_view.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/cash_drawer_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/cash_shift_item_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/net_sales_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/sales_summery_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/shift_data_box_widget.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShiftView extends StatefulWidget {
  const ShiftView({super.key});

  @override
  State<ShiftView> createState() => _ShiftViewState();
}

class _ShiftViewState extends State<ShiftView> {
  bool isOpenShift = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomDrawerAppBar(
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
          title: "shifts".tr(),
          actions: [
            IconButton(
                onPressed: () {
                  NavigationService.pushNamed(AppRouter.asyncShiftsRoute);
                },
                icon: const Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Visibility(
            visible: !isOpenShift,
            replacement: OpenShiftView(onPressed: () {
              isOpenShift = false;
              setState(() {});
            }),
            child: ListView(
              children: [
                CustomOutlineButton(
                  radius: 0.0,
                  onPressed: () {
                    NavigationService.pushNamed(AppRouter.cashManagementRoute);
                  },
                  text: "cash_management".tr(),
                  textSize: 20,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomOutlineButton(
                  radius: 0.0,
                  onPressed: () {
                    NavigationService.pushNamed(AppRouter.closeShiftRoute)
                        .then((value) {
                      if (value == "openShift") {
                        isOpenShift = true;
                        setState(() {});
                      }
                    });
                  },
                  text: "close_shift".tr(),
                  textSize: 20,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const ShiftDataBoxWidget(
                  shiftNumber: "4",
                  openShiftName: "un known",
                  openShiftDate: "22/4/2024",
                ),
                const Divider(),
                const CashDrawerWidget(),
                const Divider(),
                const SalesSummeryWidget(),
                const Divider(),
                const NetSalesWidget()
              ],
            ),
          ),
        ));
  }
}

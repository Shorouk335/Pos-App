import 'package:e_ticket_app/modules/shift/presentation/widget/cash_drawer_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/cash_shift_item_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/net_sales_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/sales_summery_widget.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/shift_data_box_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReportShiftView extends StatelessWidget {
  const ReportShiftView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: "report_shift".tr(),
        iconBack: Icons.arrow_back,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const ShiftDataBoxWidget(
              shiftNumber: "4",
              openShiftName: "un known",
              openShiftDate: "22/4/2024",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(context: context,
                      text: "the_shift_is_closed".tr(),
                    ),
                     CustomText(context: context,
                      text: " : ",
                    ),
                     CustomText(context: context,
                      text: "un known",
                    ),
                  ],
                ),
                 CustomText(context: context,
                  text: "22/4/2024",
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Divider(),
            const CashDrawerWidget(isReport: true,),
            CashShiftItemWidget(
                title: "actual_cash_amount".tr(), amount: "EGP 0.00"),
            CashShiftItemWidget(title: "difference".tr(), amount: "EGP 0.00" , isWeight: true,),
            const SizedBox(
              height: 15.0,
            ),
            const Divider(),
            const SalesSummeryWidget(),
            const Divider(),
            const NetSalesWidget()
          ],
        ),
      ),
    );
  }
}

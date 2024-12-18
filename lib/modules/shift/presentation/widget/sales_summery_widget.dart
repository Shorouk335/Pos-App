import 'package:e_ticket_app/modules/shift/presentation/widget/cash_shift_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SalesSummeryWidget extends StatelessWidget {
  const SalesSummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           const SizedBox(
                  height: 15.0,
                ),
                CustomText(context: context,
                  text: "sales_summery".tr(),
                  type: TextType.big,
                  isWeight: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CashShiftItemWidget(
                  title: "gross_sales".tr(),
                  amount: "EGP 0.0",
                  isWeight: true,
                ),
                CashShiftItemWidget(
                  title: "refunds".tr(),
                  amount: "EGP 0.0",
                ),
                CashShiftItemWidget(
                  title: "discounts".tr(),
                  amount: "EGP 0.0",
                ),
                const SizedBox(
                  height: 15.0,
                ),
      ],
    ) ;
  }
}
import 'package:e_ticket_app/modules/shift/presentation/widget/cash_shift_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CashDrawerWidget extends StatelessWidget {
  const CashDrawerWidget({super.key , this.isReport = false });
  final bool isReport ; 

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const SizedBox(
                  height: 15.0,
                ),
                CustomText(context: context,
                  text: "cash_drawer".tr(),
                  type: TextType.big,
                  isWeight: true,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CashShiftItemWidget(
                  title: "starting_cash".tr(),
                  amount: "EGP 0.0",
                ),
                CashShiftItemWidget(
                  title: "cash_payments".tr(),
                  amount: "EGP 0.0",
                ),
                CashShiftItemWidget(
                  title: "cash_refunds".tr(),
                  amount: "EGP 0.0",
                ),
                CashShiftItemWidget(
                  title: "paid_in".tr(),
                  amount: "EGP 0.0",
                ),
                CashShiftItemWidget(
                  title: "paid_out".tr(),
                  amount: "EGP 0.0",
                ),
                CashShiftItemWidget(
                  title: "expected_cash_amount".tr(),
                  amount: "EGP 0.0",
                  isWeight: !isReport,
                ), 
                if(!isReport)
                const SizedBox(
                  height: 15.0,
                ),
      ],
    );
  }
}
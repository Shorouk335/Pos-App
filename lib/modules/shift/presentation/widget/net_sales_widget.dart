import 'package:e_ticket_app/modules/shift/presentation/widget/cash_shift_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NetSalesWidget extends StatelessWidget {
  const NetSalesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const SizedBox(
                  height: 15.0,
                ),
                CashShiftItemWidget(
                  title: "net_sales".tr(),
                  amount: "EGP 0.0",
                  isWeight: true,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CashShiftItemWidget(
                  title: "cash".tr(),
                  amount: "EGP 0.0",
                ),
                
                CashShiftItemWidget(
                  title: "card".tr(),
                  amount: "EGP 0.0",
                ),
      ],
    );
  }
}
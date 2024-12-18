import 'package:e_ticket_app/modules/auth/presentation/forget_password/change_password_View.dart';
import 'package:e_ticket_app/modules/receipts/presentation/refund%20receipt/widget/refund_receipt_item_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RefundReceiptView extends StatefulWidget {
  const RefundReceiptView({super.key, required this.ticket});
  final TicketModel? ticket;

  @override
  State<RefundReceiptView> createState() => _RefundReceiptViewState();
}

class _RefundReceiptViewState extends State<RefundReceiptView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(
        title: "refund".tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: widget.ticket!.items.length + 1,
                    itemBuilder: (context, index) {
                      if (index == widget.ticket!.items.length) {
                        return Column(
                          children: [
                            const Divider(),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(context: context,
                                  text: "total".tr(),
                                  isWeight: true,
                                ),
                                 CustomText(context: context,
                                  text: "EGP 455455",
                                  isWeight: true,
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return RefundReceiptItemWidget(
                        item: widget.ticket!.items[0],
                      );
                    })),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: CustomButton(
                onPressed: () {},
                text: "${"retrieval".tr()}  EGP 1500",
                height: 50.0,
                radius: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

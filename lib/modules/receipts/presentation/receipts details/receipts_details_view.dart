
import 'package:e_ticket_app/modules/receipts/presentation/receipts%20details/widget/item_receipts_details_widegt.dart';
import 'package:e_ticket_app/modules/receipts/presentation/receipts%20details/widget/receipts_details_app_bar.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReceiptsDetailsView extends StatefulWidget {
  const ReceiptsDetailsView({super.key, required this.ticket});
  final TicketModel ticket;

  @override
  State<ReceiptsDetailsView> createState() => _ReceiptsDetailsViewState();
}

class _ReceiptsDetailsViewState extends State<ReceiptsDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:ReceiptsDetailsAppBar(ticket: widget.ticket,) , 
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(context: context,
                        text: "Refund #1-1044",
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                   Center(
                    child: Column(
                      children: [
                        CustomText(context: context,
                          text: "EGP 0.58",
                          size: 25,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        CustomText(context: context,
                          text: "Total",
                          type: TextType.description,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      CustomText(context: context,
                        text: "order".tr(),
                      ),
                       CustomText(context: context,
                        text: " : ",
                      ),
                       CustomText(context: context,
                        text: "Ticket 3:22 pm",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      CustomText(context: context,
                        text: "employee".tr(),
                      ),
                       CustomText(context: context,
                        text: " : ",
                      ),
                       CustomText(context: context,
                        text: "unknown",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                   Row(
                    children: [
                      CustomText(context: context,
                        text: "POS",
                      ),
                      CustomText(context: context,
                        text: " : ",
                      ),
                      CustomText(context: context,
                        text: "POS",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15.0,
                  ),
                   CustomText(context: context,
                    text: "Dine In",
                    isWeight: true,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(),
                ],
              ),
            ),
            SliverList.builder(
              itemCount: widget.ticket.items.length,
              itemBuilder: (context, index) {
                return ItemReceiptsDetailsWidget(
                  item: widget.ticket.items[index],
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
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
                        text: "455455",
                        isWeight: true,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(context: context,
                        text: "cash".tr(),
                      ),
                       CustomText(context: context,
                        text: "EGP 154",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(context: context,
                        text: "22/8/2024".tr(),
                      ),
                       CustomText(context: context,
                        text: "#21054",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

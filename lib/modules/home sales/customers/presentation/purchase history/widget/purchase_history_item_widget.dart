import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class PurchaseHistoryItemWidget extends StatefulWidget {
  const PurchaseHistoryItemWidget(
      {super.key, required this.onTap, required this.ticketModel});
  final void Function()? onTap;
  final TicketModel ticketModel;

  @override
  State<PurchaseHistoryItemWidget> createState() =>
      _PurchaseHistoryItemWidgetState();
}

class _PurchaseHistoryItemWidgetState extends State<PurchaseHistoryItemWidget> {
  String ticketDescription = " ";

  getItemsNameCount() {
    for (int i = 0; i < widget.ticketModel.items.length; i++) {
      if (i == 3) break;
      ticketDescription +=
          "${widget.ticketModel.items[i].name} x ${widget.ticketModel.items[i].count} ";
    }
  }

  @override
  initState() {
    getItemsNameCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20.0,
        ),
        Icon(
          Icons.payments_outlined,
          size: 30,
          color: AppColors.normalTextGrey(context),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        context: context,
                        text: "EGP ${widget.ticketModel.total}",
                        type: TextType.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      CustomText(
                        context: context,
                        text: ticketDescription,
                        type: TextType.description,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      CustomText(
                        context: context,
                        text: "Aug 22",
                        color: AppColors.normalTextGrey(context),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomText(
                        context: context,
                        text: "#4188",
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

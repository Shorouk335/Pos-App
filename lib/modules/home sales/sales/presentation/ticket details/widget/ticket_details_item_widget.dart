import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TicketDetailsItemWidget extends StatelessWidget {
  const TicketDetailsItemWidget({
    super.key,
    required this.item,
    this.isOutOfStock = false,
    required this.onClick,
    required this.onDeletePressed,
  });
  final ItemModel item;
  final bool isOutOfStock;
  final void Function() onClick;
  final void Function(BuildContext)? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey<ItemModel>(item),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: onDeletePressed,
            backgroundColor: Colors.grey.withOpacity(0.1),
            foregroundColor: Colors.grey,
            icon: Icons.delete,
            label: 'delete'.tr(),
            spacing: 5.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: IntrinsicHeight(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: item.name ?? "",
                        style: getTextStyle(context, TextType.title )
                            
                            ),
                    TextSpan(
                        text: " X ",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: 18.0)),
                    TextSpan(
                        text: item.count != null ? item.count.toString() : "1",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: 18.0)),
                  ])),
                  if (isOutOfStock)
                    const SizedBox(
                      height: 5.0,
                    ),
                  if (isOutOfStock)
                     Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        CustomText(context: context,
                          text: "out of stock",
                          color: Colors.red,
                          size: 18,
                        ),
                      ],
                    )
                ],
              )),
              const SizedBox(
                width: 50.0,
              ),
              CustomText(context: context,text: "${item.total} EGP")
            ],
          )),
        ),
      ),
    );
  }
}


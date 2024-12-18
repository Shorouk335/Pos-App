import 'package:e_ticket_app/core/service/item_shape_service.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class ItemListHomeWidget extends StatefulWidget {
  const ItemListHomeWidget(
      {super.key, required this.item, required this.onTap});
  final ItemModel item;
  final void Function()? onTap;

  @override
  State<ItemListHomeWidget> createState() => _ItemListHomeWidgetState();
}

class _ItemListHomeWidgetState extends State<ItemListHomeWidget> {
  late ItemModel favItem;
 late  void Function()? onClickTap ; 

  @override
  void initState() {
    favItem = widget.item;
    onClickTap = widget.onTap ; 
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemListHomeWidget oldWidget) {
    if (oldWidget.item != widget.item) {
      favItem = widget.item;
    }
    if (oldWidget.onTap != widget.onTap) {
      onClickTap = widget.onTap;
    }

    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClickTap,
        splashColor: Colors.transparent,
        child: Row(
          children: [
            SizedBox(
              width: favItem.shape != "sun" ? 10.0 : 8.0,
            ),
            ItemShapeService.getCurrentItemShape(
                favItem.color ?? 1, favItem.shape ?? "", false),
            SizedBox(
              width: favItem.shape != "sun" ? 10.0 : 8.0,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CustomText(
                            context: context, text: favItem.name ?? ""),
                        trailing: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: CustomText(
                                context: context, text: "category1")),
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}

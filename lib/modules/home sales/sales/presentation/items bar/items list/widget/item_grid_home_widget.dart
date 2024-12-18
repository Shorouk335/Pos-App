import 'package:e_ticket_app/core/service/item_shape_service.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class ItemGridHomeWidget extends StatefulWidget {
  const ItemGridHomeWidget({super.key , required this.itemModel , required this.onTap});
  final void Function()? onTap ; 
  final ItemModel itemModel ; 

  @override
  State<ItemGridHomeWidget> createState() => _ItemGridHomeWidgetState();
}

class _ItemGridHomeWidgetState extends State<ItemGridHomeWidget> { 

    late ItemModel favItem;
 late  void Function()? onClickTap ; 

  @override
  void initState() {
    favItem = widget.itemModel;
    onClickTap = widget.onTap ; 
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemGridHomeWidget oldWidget) {
    if (oldWidget.itemModel != widget.itemModel) {
      favItem = widget.itemModel;
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
                onTap: onClickTap , 
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ItemShapeService.getCurrentItemShape(
                        favItem.color ?? 0, favItem.shape ?? "", true),
                    CustomText(context: context,text: favItem.name ?? '' , color: Colors.white,)
                  ],
                ),
              );
  }
}
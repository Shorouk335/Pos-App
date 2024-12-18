import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({super.key ,required this.itemModel});
  final ItemModel itemModel ; 

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Row(
                  children: [
                    CustomText(context: context,text: "price".tr() ,size: 22, type: TextType.description,),
                    CustomText(context: context,text: " : ".tr(),size: 22, type: TextType.description,),
                    CustomText(context: context,text: itemModel.salary.toString() , size: 22.0,),
                  ],
                ),
                const SizedBox(height: 20.0,) , 
                Row(
                  children: [
                    CustomText(context: context,text: "quantity".tr(),size: 22, type: TextType.description,),
                    CustomText(context: context,text: " : ".tr(),size: 22, type: TextType.description,),
                    CustomText(context: context,
                        text: itemModel.count == null
                            ? "1"
                            : itemModel.count.toString() , size: 22.0,),
                  ],
                ),
              ],
            );
  }
}
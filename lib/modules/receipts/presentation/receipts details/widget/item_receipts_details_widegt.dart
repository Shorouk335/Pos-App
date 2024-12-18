import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class ItemReceiptsDetailsWidget extends StatelessWidget {
  const ItemReceiptsDetailsWidget({super.key , required this.item});
  final ItemModel item ; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
           
            children: [
               CustomText(context: context,text: item.name ?? "") ,
               const SizedBox(height: 5.0,) ,  
               Row(
                children: [
                 CustomText(context: context,text: "${item.count}" , type: TextType.description,) ,  
                  CustomText(context: context,text: " x " , type: TextType.description,) ,  
                 CustomText(context: context,text: " EGP ${item.salary}" , type: TextType.description,) ,  
      
                ],
               )
                
            ],
          ) , 
          const Spacer() , 
           CustomText(context: context,text: item.total.toString()) ,  
         
         
      
        ],
      ),
    ); 
  }
}
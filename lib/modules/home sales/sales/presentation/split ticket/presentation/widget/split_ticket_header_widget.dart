import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class SplitTicketHeaderWidget extends StatelessWidget {
  const SplitTicketHeaderWidget({super.key , required this.title , required this.onAddPressed , required this.onEditPressed}); 
  final String title ; 
  final void Function()? onAddPressed  ; 
  final void Function()? onEditPressed ; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [  
        const SizedBox(width: 15.0,),
        CustomText(context: context,text: title , isWeight: true,) , 
        const Spacer(), 
        IconButton(onPressed: onAddPressed, icon: const Icon(Icons.add_circle_outline , color: Colors.grey,)), 
        IconButton(onPressed: onEditPressed, icon: const Icon(Icons.more_vert , color: Colors.grey,)), 
    
      ],
    ) ;
  }
}
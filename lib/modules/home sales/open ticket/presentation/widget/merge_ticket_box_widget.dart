import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/circle_check_ticket.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class MergeTicketBoxWidget extends StatelessWidget {
  const MergeTicketBoxWidget({super.key , required this.isSelected , required this.ticketModel , required this.onTap});
  final bool isSelected ; 
  final TicketModel ticketModel ; 
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
       onTap:onTap ,
      child: ListTile(
        leading: CircularCheckBox(isSelected: isSelected),
        title:  CustomText(context: context,
                    text: ticketModel.name ?? "mohammmed",
                    type: TextType.title,
                    overflow: TextOverflow.ellipsis,
                  ),
        
      
      ),
    );
  }
}


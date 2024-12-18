import 'package:e_ticket_app/modules/shift/presentation/cash%20managment/cash_management_view.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class PayInOutItemWidget extends StatelessWidget {
  const PayInOutItemWidget({super.key , required this.payModel});
  final PayModel payModel ; 

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Column(
        children: [
          Row(
            children: [
               CustomText(context: context,text: "10:20 PM" , ), 
              const SizedBox(width: 10.0,), 
               CustomText(context: context,text: "UN KNOWWN " , ), 
              const Spacer() , 
              CustomText(context: context,text: "EGP ${payModel.amount}" , ), 
              
            ],
          ),
          const SizedBox(height: 15.0,), 
          const Divider()
        ],
      ),
    );
  }
}
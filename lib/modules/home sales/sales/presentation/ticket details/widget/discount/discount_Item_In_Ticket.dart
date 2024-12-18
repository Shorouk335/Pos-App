import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class DiscountItemInTicket extends StatefulWidget {
  const DiscountItemInTicket({super.key , required this.discountModel , required this.onDeletePressed});
  final DiscountModel discountModel ; 
  final  void Function()? onDeletePressed ; 

  @override
  State<DiscountItemInTicket> createState() => _DiscountItemInTicketState();
}

class _DiscountItemInTicketState extends State<DiscountItemInTicket> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 12.0,
        ),
      CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            radius: 25,
            child: Icon(
              Icons.discount_outlined,
              size: 25,
              color: AppColors.normalTextGrey(context),
            ),
          ),
        const SizedBox(
          width: 15.0,
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
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      CustomText(
                          context: context, text: widget.discountModel.name ?? ""),
                      const Spacer(),
                      CustomText(
                        context: context,
                        text: widget.discountModel.isPercentage == true
                            ? "${widget.discountModel.value} %"
                            : widget.discountModel.value.toString(),
                      ),
                      SizedBox(width: 5.0,) , 
                      IconButton(onPressed: widget.onDeletePressed , 
                       icon: Icon(Icons.delete , 
                       color: AppColors.hintText(context),
                       )) , 
                      const SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                )),
          ),
        ),
    
      ],
    );
  }
}

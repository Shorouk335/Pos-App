import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class ReceiptsItemWidget extends StatelessWidget {
  const ReceiptsItemWidget({super.key , required this.ticketModel});
  final TicketModel ticketModel ; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.pushNamed(AppRouter.receiptsDetailsRoute , extra: ticketModel );
      },
      child: ListTile(
        leading:  Icon(
            Icons.payments_outlined,
            size: 30,
            color: AppColors.normalTextGrey(context),
          ),  
          title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(context: context,
                            text: "EGP ${ticketModel.total}",
                            type: TextType.title,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5.0,), 
                           CustomText(context: context,
                            text: "3:22 PM",
                            type: TextType.description,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ), 
                      trailing:  CustomText(context: context,
                            text: "#1548444",
                            color: AppColors.normalTextGrey(context),
                          ), 
      ),
    ) ;
  }
}
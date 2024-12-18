import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/widget/discount/discount_Item_In_Ticket.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllDiscountInTicketView extends StatefulWidget {
  const ShowAllDiscountInTicketView({super.key});

  @override
  State<ShowAllDiscountInTicketView> createState() =>
      _ShowAllDiscountInTicketViewState();
}

class _ShowAllDiscountInTicketViewState
    extends State<ShowAllDiscountInTicketView> {

  List<DiscountModel> discountList = <DiscountModel>[] ; 

  addToDelete(DiscountModel discount){
   discountList.remove(discount) ;  
   setState(() {
     
   });
  }
  @override
  initState(){
    super.initState();
  
  SalesCubit.get(context).ticketModel.discountList.forEach( (element) {
      discountList.add(element.copy());
  }
    
  ) ;
  

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return Scaffold(
            appBar: CustomLightAppBar(
              title: "discounts".tr(),
              actions: [
                TextButton(
                    onPressed: () {
                     cubit.changeDiscountListInTicket(discountList);
                      NavigationService.popPage();
                    },
                    child: CustomText(
                      context: context,
                      text: "save".tr(),
                      type: TextType.big
                    ))
              ],
            ),
            body: ListView.builder(
                itemCount: discountList.length,
                itemBuilder: (context, index) {
                  return DiscountItemInTicket(
                    discountModel :discountList[index],
                    onDeletePressed: () {
                      addToDelete(discountList[index]);
                    },
                  );
                }));
      },
    );
  }
}

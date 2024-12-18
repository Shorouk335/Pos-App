import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/purchase%20history/widget/purchase_history_item_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PurchaseHistoryCustomerView extends StatefulWidget {
  const PurchaseHistoryCustomerView({super.key});

  @override
  State<PurchaseHistoryCustomerView> createState() =>
      _PurchaseHistoryCustomerViewState();
}

class _PurchaseHistoryCustomerViewState
    extends State<PurchaseHistoryCustomerView> {
  TextEditingController searchController = TextEditingController();
  bool showCloseIcon = false;
  List<TicketModel> tickets = [
    TicketModel(
        total: 15000,
        name: "TicketA",
        items: [
          ItemModel(name: "A", count: 5, salary: 300) , 
          ItemModel(name: "A", count: 5, salary: 300) , 
          ItemModel(name: "A", count: 5, salary: 300) , 
          ItemModel(name: "A", count: 5, salary: 300) , 
          
          ]),
    TicketModel(
        total: 1000,
        name: "TicketB",
        items: [
          ItemModel(name: "B", count: 5, salary: 300) , 
          ItemModel(name: "B", count: 5, salary: 300) , 
          ItemModel(name: "B", count: 5, salary: 300) , 
        
          
          
          ]),
    TicketModel(
        total: 10040,
        name: "TicketC",
        items: [
          ItemModel(name: "C", count: 5, salary: 300) , 
          ItemModel(name: "C", count: 5, salary: 300) , 
        
        
        ]),
    TicketModel(
        total: 155000,
        name: "TicketD",
        items: [ItemModel(name: "D", count: 5, salary: 300)]),
  ];

  @override
  initState() {
    searchController.addListener(() {
      if (searchController.text == "") {
        showCloseIcon = false;
      } else {
        showCloseIcon = true;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: "purchase_history".tr(),
        iconBack: Icons.arrow_back,
      ),
      body: Column(
        children: [
          CustomTextFormField(
            hintText: "search_by_receipt_number".tr(),
            prefixWidget:  Icon(
              Icons.search,
              color: AppColors.normalTextGrey(context),
              size: 28.0,
            ),
            textController: searchController,
            suffixWidget:  IconButton(
              onPressed: (){
                 searchController.text = "" ; 
                  setState(() {
                    
                  });
              },
              icon: Icon(
                      showCloseIcon ? Icons.close : null,
                        color: AppColors.normalTextGrey(context),
                        size: 20.0,
                      ),
            ),
           
            isSearch: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
            onChanged: (s) {},
          ),
          const Divider(),
          
          Expanded(
            child: ListView.builder(
                
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return PurchaseHistoryItemWidget(
                    ticketModel: tickets[index],
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/receipts/presentation/widget/receipts_header_widget.dart';
import 'package:e_ticket_app/modules/receipts/presentation/widget/receipts_item_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ReceiptsView extends StatefulWidget {
  const ReceiptsView({super.key});

  @override
  State<ReceiptsView> createState() => _ReceiptsViewState();
}

class _ReceiptsViewState extends State<ReceiptsView> {
  TextEditingController searchController = TextEditingController();
  bool showCloseIcon = false;
  List<TicketModel> tickets = List.filled(
    20,
    TicketModel(total: 15000, name: "TicketA", items: [
      ItemModel(name: "A", count: 5, salary: 300 , total: 5000),
      ItemModel(name: "B", count: 4, salary: 300 , total: 7844 ),
      ItemModel(name: "S", count: 7, salary: 300 , total: 4744),
  
    
    ]),
  );

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
        appBar: CustomDrawerAppBar(
            onMenuPressed: () {
              Scaffold.of(context).openDrawer();
            },
            title: "receipts".tr()),
        body: Column(
          children: [
            CustomTextFormField(
              hintText: "search".tr(),
              prefixWidget:  Icon(
                Icons.search,
                color: AppColors.normalTextGrey(context),
                size: 28.0,
              ),
              textController: searchController, 
              suffixWidget:  IconButton(
                onPressed:(){
                  searchController.text = "" ; 
                  setState(() {
                    
                  });
                } ,
                icon: Icon(
                       showCloseIcon ? Icons.close : null,
                        color: AppColors.normalTextGrey(context),
                        size: 20.0,
                      ),
              ),
              
              isSearch: true,
              contentPadding: const EdgeInsets.all(15.0),
              onChanged: (s) {},
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: tickets.length,
                  itemBuilder: (context, index) {
                    return StickyHeader(
                      header: ReceiptsHeaderWidget(
                        history: "${index + 1}",
                      ),
                      content: ReceiptsItemWidget(
                        ticketModel: tickets[index],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

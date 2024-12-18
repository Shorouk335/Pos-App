import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/cubit/split_ticket_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/presentation/widget/split_ticket_box_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitTicketView extends StatefulWidget {
  const SplitTicketView({super.key, required this.ticketModel});
  final TicketModel ticketModel;

  @override
  State<SplitTicketView> createState() => _SplitTicketViewState();
}

class _SplitTicketViewState extends State<SplitTicketView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SplitTicketCubit()..initialSplitTicketList(widget.ticketModel),
      child: BlocConsumer<SplitTicketCubit, SplitTicketState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SplitTicketCubit.get(context);
          return Scaffold(
              appBar: CustomDarkAppBar(
                title: "split_ticket".tr(),
                actions: [
                  IgnorePointer(
                    ignoring: false,
                    child: TextButton(
                        onPressed: () {
                          SalesCubit.get(context).deleteCurrentTicket();
                          HiveService.updateTicketList(cubit.getFinalSplitTicketsToSave());
                          NavigationService.popPage();
                        },
                        child:
                            CustomText(context: context,text: "save".tr(), color: Colors.white)),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ListView.builder(
                  itemCount: cubit.ticketList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SplitTicketBoxWidget(
                      ticketModel: cubit.ticketList[index],
                      ticketIndex: index,
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}

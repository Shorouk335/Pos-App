import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/merge%20ticket/merge_ticket_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/merge%20ticket/merge_ticket_state.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/merge_ticket_box_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MergeTicketView extends StatefulWidget {
  const MergeTicketView({super.key, required this.margeTicketList});
  final List<TicketModel> margeTicketList;

  @override
  State<MergeTicketView> createState() => _MergeTicketViewState();
}

class _MergeTicketViewState extends State<MergeTicketView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MergeTicketCubit()..initialDateOfMargeTicket(widget.margeTicketList),
      child: BlocConsumer<MergeTicketCubit, MergeTicketState>(
        listener: (context, state) {
          if (state is CompleteMergeTicketStates) {
            SalesCubit.get(context).deleteCurrentTicket();
            NavigationService.goNamed(AppRouter.layoutRoute);
          }
        },
        builder: (context, state) {
          final cubit = MergeTicketCubit.get(context);
          return SafeArea(
              child: Scaffold(
            appBar: CustomLightAppBar(
              title: "merge_to".tr(),
              iconBack: Icons.arrow_back,
              actions: [
                TextButton(
                    onPressed: () {
                      cubit.mergeTicketInDB();
                    },
                    child: CustomText(context: context,
                      text: "merge".tr(),
                      color: AppColors.primary(context),
                    ))
              ],
            ),
            body: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: ListView.separated(
                  separatorBuilder: (context, state) {
                    return const Divider();
                  },
                  itemCount: widget.margeTicketList.length,
                  itemBuilder: (context, index) {
                    return MergeTicketBoxWidget(
                      isSelected:
                          cubit.margeTicketList[index].isSelected ?? false,
                      onTap: () {
                        cubit.changeValueOfMargeTicketCheckBox(index);
                      },
                      ticketModel: widget.margeTicketList[index],
                    );
                  }),
            ),
          ));
        },
      ),
    );
  }
}

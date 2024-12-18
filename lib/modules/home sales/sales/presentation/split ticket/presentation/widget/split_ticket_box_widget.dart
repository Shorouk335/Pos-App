import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/cubit/split_ticket_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/presentation/widget/split_ticket_header_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/presentation/widget/split_ticket_item_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/widget/total_ticket_salary_widget.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitTicketBoxWidget extends StatefulWidget {
  const SplitTicketBoxWidget(
      {super.key, required this.ticketModel, required this.ticketIndex});
  final TicketModel ticketModel;
  final int ticketIndex;

  @override
  State<SplitTicketBoxWidget> createState() => _SplitTicketBoxWidgetState();
}

class _SplitTicketBoxWidgetState extends State<SplitTicketBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitTicketCubit, SplitTicketState>(
      builder: (context, state) {
        final cubit = SplitTicketCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: AppColors.greyBorder),
              color: AppColors.backgroundColorMode(context),
            ),
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SplitTicketHeaderWidget(
                  title: widget.ticketModel.name ?? "",
                  onAddPressed: cubit.addNewTicket,
                  onEditPressed: () {
                    NavigationService.pushNamed(AppRouter.editSplitTicketRoute,
                            extra: widget.ticketModel)
                        .then((value) {
                      if (value == TicketModel) {
                        cubit.ticketList[widget.ticketIndex] = value;
                      }
                    });
                  },
                ),
                const Divider(),
                Visibility(
                  visible: widget.ticketModel.items.isNotEmpty,
                  replacement: const Expanded(child: SizedBox()),
                  child: Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: widget.ticketModel.items.length + 1,
                        itemBuilder: (context, index) {
                          if (index == widget.ticketModel.items.length) {
                            return TotalTicketSalaryWidget(
                              title: "total".tr(),
                              value:
                                  "${widget.ticketModel.total ?? "0.00"} EGP",
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SplitTicketItemWidget(
                                itemIndex: index,
                                ticketIndex: widget.ticketIndex,
                                item: widget.ticketModel.items[index],
                                isOutOfStock: false,
                              ),
                            );
                          }
                        }),
                  ),
                ),
                IgnorePointer(
                  ignoring: false,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomButton(
                      onPressed: () {
                        cubit.moveItemsToHereTicket(widget.ticketIndex);
                      },
                      text: "move_here".tr(),
                      height: 50.0,
                      radius: 0.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

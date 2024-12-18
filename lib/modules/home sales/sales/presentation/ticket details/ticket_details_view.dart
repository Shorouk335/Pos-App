import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/add%20customer/add_customer_button_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/popUp%20menu/ticket_pop_up_menu.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/ticket%20nameAndNumber/ticket_nameAndNumber.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_ticket_box.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/widget/ticket%20type%20pop%20up/ticket_type-pop_up.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/widget/ticket_details_item_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/widget/total_ticket_salary_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketDetailsView extends StatefulWidget {
  const TicketDetailsView({super.key});

  @override
  State<TicketDetailsView> createState() => _TicketDetailsViewState();
}

class _TicketDetailsViewState extends State<TicketDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesCubit, SalesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return Scaffold(
          appBar: const CustomDarkAppBar(
            titleWidget: TicketNameAndNumberWidget(),
            actions: [
              AddCustomerButtonWidget(),
              TicketPopMenuWidget(),
            ],
          ),
          body: Column(
            children: [
              const TicketTypePopUpWidget(),
              const Divider(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList.separated(
                      itemCount: cubit.ticketModel.items.length,
                      itemBuilder: (context, index) {
                        return TicketDetailsItemWidget(
                          item: cubit.ticketModel.items[index],
                          onDeletePressed: (context) {
                            cubit.deleteItemFromTicket(index);
                          },
                          onClick: () {
                            NavigationService.pushNamed(
                                    AppRouter.editItemTicketRoute,
                                    extra:
                                        cubit.ticketModel.items[index].copy())
                                .then((value) {
                              if (value != null) {
                                cubit.editItemInTicket(
                                    item: value, index: index);
                              }
                            });
                          },
                          isOutOfStock:
                              index == cubit.ticketModel.items.length - 1
                                  ? true
                                  : false,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10.0,
                        );
                      },
                    ),
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: cubit.ticketModel.discountList.isNotEmpty,
                        child: InkWell(
                          onTap: () {
                            NavigationService.pushNamed(
                                AppRouter.showAllDiscountsInTicketRoute);
                          },
                          child: TotalTicketSalaryWidget(
                              title: "discount".tr(),
                              value:
                                  "${cubit.ticketModel.totalDiscount ?? "0.00"} EGP"),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: cubit.ticketModel.items.isNotEmpty,
                        child: Column(
                          children: [
                            const Divider(),
                            TotalTicketSalaryWidget(
                                title: "total".tr(),
                                value:
                                    "${cubit.ticketModel.total ?? "0.00"} EGP"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: AppColors.backgroundColorMode(context),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SalesTicketBoxWidget(
                    withShadow: false,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

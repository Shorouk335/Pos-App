import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/manager/item_home_style_service.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/sales_app_bar.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_ticket_box.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/pop_up_home_box_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/search_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesCubit, SalesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return Scaffold(
          appBar: SalesAppBar(
            onMenuPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          body: Column(
            children: [
              Container(
                color: AppColors.backgroundGray(context),
                child: Column(
                  children: [
                    const Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                        child: SalesTicketBoxWidget()),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: AppColors.greyBorder, width: 2.0)),
                ),
                child: Visibility(
                  visible: cubit.isSearch,
                  replacement: PopUpHomeBoxWidget(
                    onPressed: () {
                      cubit.changeIsSearchInItem(true);
                    },
                  ),
                  child: SearchHomeWidget(onPressed:  () {
                          cubit.changeIsSearchInItem(false);
                        },)
                ),
              ),
              const SizedBox(height: 10.0),
              ItemHomeStyleService.getItemHomeStyle(itemHomeStyle:cubit.itemHomeStyle)
            ],
          ),
        );
      },
    );
  }
}

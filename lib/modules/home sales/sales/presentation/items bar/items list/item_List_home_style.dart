import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/items%20list/widget/item_list_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// USE IN NORMAL ITEM AND ITEM BY CATEGORY IN SALES HOME
class ItemListHomeStyle extends StatefulWidget {
  const ItemListHomeStyle({super.key});

  @override
  State<ItemListHomeStyle> createState() =>
      _ItemListHomeStyleState();
}

class _ItemListHomeStyleState extends State<ItemListHomeStyle> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(builder: (context, state) {
      final cubit = SalesCubit.get(context);
      return Expanded(
          child: ListView.builder(
              itemCount: cubit.items.length,
              itemBuilder: (context, index) {
                return ItemListHomeWidget(
                    item: cubit.items[index],
                    onTap: () {
                      if (cubit.items[index].salary == null) {
                        NavigationService.pushNamed(AppRouter.itemDetailsRoute,
                                extra: cubit.items[index])
                            .then((value) {
                          if (value != null) {
                            cubit.addItemToTicket(value);
                          }
                        });
                      } else {
                        cubit.addItemToTicket(cubit.items[index]);
                      }
                    });
              }));
    });
  }
}

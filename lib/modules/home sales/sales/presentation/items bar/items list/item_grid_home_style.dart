import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/items%20list/widget/item_grid_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// USE IN NORMAL ITEM AND ITEM BY CATEGORY IN SALES HOME
class ItemGridHomeStyle extends StatefulWidget {
  const ItemGridHomeStyle({super.key});

  @override
  State<ItemGridHomeStyle> createState() =>
      _ItemGridHomeStyleState();
}

class _ItemGridHomeStyleState extends State<ItemGridHomeStyle> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(builder: (context, state) {
      final cubit = SalesCubit.get(context);
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: cubit.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemGridHomeWidget(
                itemModel: cubit.items[index],
                onTap: () {
                 if (cubit.items[index].salary == null ) {
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
                },
              );
            }),
      ));
    });
  }
}

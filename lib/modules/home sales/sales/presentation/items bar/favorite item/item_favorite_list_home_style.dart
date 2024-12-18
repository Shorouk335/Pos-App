import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/item_empty_favorite_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/widget/edit_favorite_button_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/items%20list/widget/item_list_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// USE IN FAVORITE ITEM IN SALES HOME
class ItemFavoriteListHomeStyle extends StatefulWidget {
  const ItemFavoriteListHomeStyle({super.key});

  @override
  State<ItemFavoriteListHomeStyle> createState() =>
      _ItemFavoriteListHomeStyleState();
}

class _ItemFavoriteListHomeStyleState extends State<ItemFavoriteListHomeStyle> {
  @override
  initState() {
    BlocProvider.of<SalesCubit>(context).getFavoriteListFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesCubit, SalesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SalesCubit.get(context);
          return Expanded(
              child: Visibility(
            visible: cubit.favoriteItemsList.isNotEmpty,
            replacement: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: ItemEmptyFavoriteWidget(),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cubit.favoriteItemsList.length,
                      itemBuilder: (context, index) {
                        return ItemListHomeWidget(
                            item: cubit.favoriteItemsList[index],
                            onTap: () {
                              if (cubit.favoriteItemsList[index].salary ==
                                  null) {
                                NavigationService.pushNamed(
                                        AppRouter.itemDetailsRoute,
                                        extra: cubit.favoriteItemsList[index])
                                    .then((value) {
                                  if (value != null) {
                                    cubit.addItemToTicket(value);
                                  }
                                });
                              } else {
                                cubit.addItemToTicket(
                                    cubit.favoriteItemsList[index]);
                              }
                            });
                      }),
                ),
                EditFavoriteButtonWidget(
                  onTap: () {
                    NavigationService.pushNamed(
                        AppRouter.editFavoriteItemRoute);
                  },
                )
              ],
            ),
          ));
        });
  }
}

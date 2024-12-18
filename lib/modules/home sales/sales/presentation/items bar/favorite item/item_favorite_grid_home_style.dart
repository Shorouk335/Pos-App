import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/item_empty_favorite_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/widget/edit_favorite_button_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/items%20list/widget/item_grid_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// USE IN FAVORITE ITEM IN SALES HOME
class ItemFavoriteGridHomeStyle extends StatefulWidget {
  const ItemFavoriteGridHomeStyle({super.key});

  @override
  State<ItemFavoriteGridHomeStyle> createState() =>
      _ItemFavoriteGridHomeStyleState();
}

class _ItemFavoriteGridHomeStyleState extends State<ItemFavoriteGridHomeStyle> {

  @override
  initState() {
    super.initState();
    BlocProvider.of<SalesCubit>(context).getFavoriteListFromDB(); 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(builder: (context, state) {
      final cubit = SalesCubit.get(context);
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
        child: Visibility(
          visible: cubit.favoriteItemsList.isNotEmpty,
          replacement: ItemEmptyFavoriteWidget(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemCount: cubit.favoriteItemsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemGridHomeWidget(
                        itemModel: cubit.favoriteItemsList[index],
                        onTap: () {
                          if (cubit.favoriteItemsList[index].salary == null) {
                            NavigationService.pushNamed(
                                    AppRouter.itemDetailsRoute,
                                    extra: cubit.favoriteItemsList[index])
                                .then((value) {
                              if (value != null) {
                                cubit.addItemToTicket(value);
                              }
                            });
                          } else {
                            cubit.addItemToTicket(cubit.favoriteItemsList[index]);
                          }
                        },
                      );
                    }),
              ),
              EditFavoriteButtonWidget(
                onTap: () {
                  NavigationService.pushNamed(AppRouter.editFavoriteItemRoute); 
                },
              )
            ],
          ),
        ),
      ));
    });
  }
}

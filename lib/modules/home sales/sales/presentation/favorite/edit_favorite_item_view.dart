import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/widget/local_item_favorite_list_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/favorite/widget/save_favorite_item_box.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/add%20sales%20item/cancel_changed_add_sales_item_dialog.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/floating_sales_item_widget.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

class EditFavoriteItemView extends StatefulWidget {
  const EditFavoriteItemView({super.key});

  @override
  State<EditFavoriteItemView> createState() => _EditFavoriteItemViewState();
}

class _EditFavoriteItemViewState extends State<EditFavoriteItemView>
    with SingleTickerProviderStateMixin {
  List<ItemModel> favoriteItems = <ItemModel>[];
  ScrollController scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    favoriteItems = HiveService.getFavoriteList();
  }

  Future saveNewFavoriteItems() async {
    await HiveService.clearFavoriteItemsFromDB().then((value) async {
      await HiveService.addFavoriteToDB(favoriteItems);
    });
  }

  void onReorderFinished(List<ItemModel> newFavItems) {
    scrollController.jumpTo(scrollController.offset);
    setState(() {
      favoriteItems
        ..clear()
        ..addAll(newFavItems);
    });
  }

  void deleteFavoriteItem(int index) {
    setState(() {
      favoriteItems.removeAt(index);
    });
  }

  void addFavoriteItem(ItemModel item) {
    setState(() {
      favoriteItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomDarkAppBar(
          title: "edit_favorite".tr(),
          onBackPressed: () {
            showCancelChangedAddSalesItemDialog(context);
          },
        ),
        body: ListView(
          controller: scrollController,
          children: [
            BlocBuilder<SalesCubit, SalesStates>(
              builder: (context, state) {
                return SaveFavoriteItemBox(
                  onTap: () {
                    saveNewFavoriteItems().then((value) {
                      SalesCubit.get(context).changeFavoriteList(favoriteItems);
                      NavigationService.popPage(); 
                    });
                  },
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.dividerColor(context),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomText(
                      text: "favorites".tr(),
                      context: context,
                    ),
                  ),
                  Divider(),
                  _buildFavoriteList()
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingItemsAndSettingItemWidget(
          onPressed: () {
            NavigationService.pushNamed(AppRouter.addFavoriteItemRoute)
                .then((value) {
              if (value is ItemModel) {
                addFavoriteItem(value);
              }
            });
          },
        ));
  }

  Widget _buildFavoriteList() {
    Reorderable buildReorderable(
        ItemModel item, Animation<double> itemAnimation, int index) {
      return Reorderable(
        key: ValueKey(item.id),
        builder: (context, dragAnimation, inDrag) {
          return AnimatedBuilder(
            animation: dragAnimation,
            builder: (context, _) {
              return SizeFadeTransition(
                  sizeFraction: 0.7,
                  curve: Curves.easeInOut,
                  animation: itemAnimation,
                  child: LocalItemFavoriteListWidget(
                    item: item,
                    onTap: () {
                      deleteFavoriteItem(index);
                    },
                  ));
            },
          );
        },
      );
    }

    return ImplicitlyAnimatedReorderableList<ItemModel>(
      items: favoriteItems,
      shrinkWrap: true,
      reorderDuration: const Duration(milliseconds: 200),
      liftDuration: const Duration(milliseconds: 300),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
      onReorderFinished: (oldOption, from, to, newOption) {
        onReorderFinished(newOption);
      },
      itemBuilder: (context, itemAnimation, option, index) {
        return buildReorderable(option, itemAnimation, index);
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

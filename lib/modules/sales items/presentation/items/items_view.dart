import 'package:e_ticket_app/modules/sales%20items/presentation/items/widget/item_app_bar_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/widget/item_list_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/empty_sales_item_widget.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/loadingAndError.dart';
import 'package:flutter/material.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  ///////////logic for try only  /////////////
  List<ItemModel> itemList = [
    ItemModel(name: "item 1", isSelected: false, shape: "sun", color: 0 , price: 10),
    ItemModel(name: "item 2", isSelected: false, shape: "circle", color: 1),
    ItemModel(name: "item 3", isSelected: false, shape: "octagon", color: 2 , price: 80),
    ItemModel(name: "item 4", isSelected: false, shape: "square", color: 3),
    ItemModel(name: "item 5", isSelected: false, shape: "sun", color: 4),
    ItemModel(name: "item 6", isSelected: false, shape: "square", color: 5 , price: 47),
    ItemModel(name: "item 7", isSelected: false, shape: "octagon", color: 6),
    ItemModel(name: "item 8", isSelected: false, shape: "circle", color: 7),
  ];

  selectItemOrNot(ItemModel item) {
    setState(() {
      item.isSelected = !item.isSelected!;
    });
  }

  deleteItems() {
    itemList.removeWhere((item) => item.isSelected == true);
    setState(() {});
  }

  int getNumberOfSelectedItem() {
    int count = 0;
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i].isSelected == true) {
        count++;
      }
    }
    return count;
  }

  bool isSelectedOrNotItem() {
    return itemList.any((element) => element.isSelected == true);
  }

  removeSelectMode() {
    for (var element in itemList) {
      element.isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ItemAppBarWidget(
          typeName: getNumberOfSelectedItem() == 1 ? "item" : "items",
          isNormalAppBar: isSelectedOrNotItem(),
          count: getNumberOfSelectedItem(),
          onDeletePressed: deleteItems,
          onBackPressed: removeSelectMode,
        ),
        body: LoadingAndError(
            isLoading: false,
            isError: itemList.isEmpty,
            errorWidget: const EmptySalesItemWidget(
              salesItemType: SalesItemType.items,
            ),
            child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return ItemListWidget(
                    item: itemList[index],
                    onLongPress: () {
                      selectItemOrNot(itemList[index]);
                    },
                  );
                })),
        // add item 
        // floatingActionButton: FloatingItemsAndSettingItemWidget(
        //   onPressed: () {
        //     NavigationService.pushNamed(AppRouter.addEditItemsRoute);
        //   },
        // )
        );
  }
}

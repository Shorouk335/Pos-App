import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/categories/add%20edit%20categories/widget/assign_item_list_widget.dart';
import 'package:e_ticket_app/modules/setting/presentation/taxes/create%20edit%20tax/widget/apply_item_to_tax_pop_up_widget.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/loadingAndError.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

class AssignItemPageView extends StatefulWidget {
  const AssignItemPageView({super.key, required this.isFromTaxes});
  final bool isFromTaxes;

  @override
  State<AssignItemPageView> createState() => _AssignItemPageViewState();
}

class _AssignItemPageViewState extends State<AssignItemPageView> {
  ///////////logic for try only  /////////////
  TextEditingController searchController = TextEditingController();
  List<ItemModel> itemList = [
    ItemModel(name: "item 1", isSelected: false, shape: "sun", color: 0),
    ItemModel(name: "item 2", isSelected: false, shape: "circle", color: 1),
    ItemModel(name: "item 3", isSelected: false, shape: "octagon", color: 2),
    ItemModel(name: "item 4", isSelected: false, shape: "square", color: 3),
    ItemModel(name: "item 5", isSelected: false, shape: "sun", color: 4),
    ItemModel(name: "item 6", isSelected: false, shape: "square", color: 5),
    ItemModel(name: "item 7", isSelected: false, shape: "octagon", color: 6),
    ItemModel(name: "item 8", isSelected: false, shape: "circle", color: 7),
  ];
  //  by cubit send in state
  late List<ItemModel> itemForSearchList;

  @override
  void initState() {
    itemForSearchList = itemList;
    super.initState();
  }

  bool isEmptyItem = false;

  searchInItems(String itemName) {
    itemForSearchList =
        itemList.where((element) => element.name!.contains(itemName)).toList();
    if (itemForSearchList.isNotEmpty) {
      isEmptyItem = false;
    } else {
      isEmptyItem = true;
    }
    setState(() {});
  }

  changeValueItemCheckBox(ItemModel item) {
    item.isSelected = !item.isSelected!;
    setState(() {});
  }

  selectAllItems() {
    for (var element in itemList) {
      element.isSelected = true;
    }
    Navigator.of(context).pop();
    setState(() {
      
    });
  }
  clearSelectionsAllItems() {
    for (var element in itemList) {
      element.isSelected = false;
    }
      Navigator.of(context).pop();
    setState(() {
      
    });
  }

  @override
  dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: widget.isFromTaxes
            ? "apply_tax_to_items".tr()
            : "assign_item_to_category".tr(),
        actions: [
          TextButton(
              onPressed: () {},
              child: CustomText(context: context,
                text: "save".tr(),
                type: TextType.big,
              )),
          Visibility(
              visible: widget.isFromTaxes,
              child: ApplyItemsToTaxPopUpWidget(
                  onSelectAllTap: selectAllItems ,
                  onClearSelectionsTap:clearSelectionsAllItems ,

              ))
        ],
      ),
      body: Column(
        children: [
          CustomTextFormField(
            textController: searchController,
            hintText: "search_item".tr(),
            prefixWidget:  Icon(
              Icons.search,
              color: AppColors.normalTextGrey(context),
              size: 25.0,
            ),
            suffixWidget: IconButton(
              onPressed: () {
                searchController.text = "";
                setState(() {});
              },
              icon:  Icon(
                Icons.close,
                color: AppColors.normalTextGrey(context),
                size: 25.0,
              ),
            ),
            isSearch: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
            onChanged: (s) {
              searchInItems(s);
            },
          ),
          const Divider(),
          Expanded(
            child: LoadingAndError(
                isLoading: false,
                isError: isEmptyItem,
                errorWidget: CustomText(context: context,text: "no_existing_items_found".tr()),
                child: ImplicitlyAnimatedReorderableList<ItemModel>(
                  items: itemForSearchList,
                  areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
                  onReorderFinished: (item, from, to, newItems) {
                    setState(() {
                      itemForSearchList
                        ..clear()
                        ..addAll(newItems);
                    });
                  },
                  itemBuilder: (context, itemAnimation, item, index) {
                    return Reorderable(
                      key: ValueKey(item),
                      builder: (context, dragAnimation, inDrag) {
                        return SizeFadeTransition(
                            sizeFraction: 0.7,
                            curve: Curves.easeInOut,
                            animation: itemAnimation,
                            child: AssignItemListWidget(
                              item: item,
                              onTap: () {
                                changeValueItemCheckBox(item);
                              },
                              onChanged: (c) {
                                changeValueItemCheckBox(item);
                              },
                            ));
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

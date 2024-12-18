import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/items%20list/widget/item_list_home_widget.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddFavoriteItemView extends StatefulWidget {
  const AddFavoriteItemView({super.key});

  @override
  State<AddFavoriteItemView> createState() => _AddFavoriteItemViewState();
}

class _AddFavoriteItemViewState extends State<AddFavoriteItemView> {
  TextEditingController searchController = TextEditingController();
    bool showCloseIcon = false;


  List<ItemModel> itemList = [
    ItemModel(name: "item 1", isSelected: false, id: 0),
    ItemModel(name: "item 2", isSelected: false, id: 1),
    ItemModel(name: "item 3", isSelected: false, id: 2),
    ItemModel(name: "item 4", isSelected: false, id: 11),
    ItemModel(name: "item 5", isSelected: false, id: 12),
    ItemModel(name: "item 6", isSelected: false, id: 13),
    ItemModel(name: "item 7", isSelected: false, id: 14),
    ItemModel(name: "item 8", isSelected: false, id: 15),
  ];
    @override
  initState() {
    searchController.addListener(() {
      if (searchController.text == "") {
        showCloseIcon = false;
      } else {
        showCloseIcon = true;
      }
      setState(() {});
    });
    super.initState();
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
        title: "add_item_to_favorite".tr(),
      ),
      body: Column(
        children: [
          CustomTextFormField(
            textController: searchController,
            hintText: "search_item".tr(),
            prefixWidget: Icon(
              Icons.search,
              color: AppColors.normalTextGrey(context),
              size: 25.0,
            ),
            suffixWidget: Visibility(
              visible: showCloseIcon,
              child: IconButton(
                onPressed: () {
                  searchController.text = "";
                  setState(() {});
                },
                icon: Icon(
                  Icons.close,
                  color: AppColors.normalTextGrey(context),
                  size: 25.0,
                ),
              ),
            ),
            isSearch: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
            onChanged: (s) {},
          ),
          const Divider(),
          Expanded(
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return ItemListHomeWidget(
                      item: itemList[index],
                      onTap: () {
                        Navigator.of(context).pop(itemList[index]);
                      },
                    );
                  })),
        ],
      ),
    );
  }
}

import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/category_model.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/categories/widget/category_app_bar_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/categories/widget/category_item_list_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/empty_sales_item_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/floating_sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/loadingAndError.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}
 
class _CategoriesViewState extends State<CategoriesView> {
   ///////////logic for try only  /////////////
   List<CategoryModel> categoriesList = [
    CategoryModel(name: "category 1", isSelected: false),
    CategoryModel(name: "category 2", isSelected: false),
    CategoryModel(name: "category 3", isSelected: false),
    CategoryModel(name: "category 4", isSelected: false),
  ];

  selectCategoryOrNot(CategoryModel item) {
    setState(() {
      item.isSelected = !item.isSelected!;
    });
  }

  deleteCategories() {
    categoriesList.removeWhere((item) => item.isSelected == true);
    setState(() {});
  }

  int getNumberOfSelectedCategory() {
    int count = 0;
    for (int i = 0; i < categoriesList.length; i++) {
      if (categoriesList[i].isSelected == true) {
        count++;
      }
    }
    return count;
  }

  bool isSelectedOrNotCategory() {
    return categoriesList.any((element) => element.isSelected == true);
  }

  removeSelectMode() {
    for (var element in categoriesList) {
      element.isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CategoryAppBarWidget(
             typeName: getNumberOfSelectedCategory() == 1 ? "category" : "categories",
          isNormalAppBar: isSelectedOrNotCategory(),
          count: getNumberOfSelectedCategory(),
          onDeletePressed: deleteCategories,
          onBackPressed: removeSelectMode,

        ) , 
        body: LoadingAndError(
            isLoading: false,
            isError: categoriesList.isEmpty,
            errorWidget: const EmptySalesItemWidget(
              salesItemType: SalesItemType.categories,
            ),
            child: ListView.builder(
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return CategoryItemListWidget(
                    category:  categoriesList[index] , 
                    onLongPress: (){
                      selectCategoryOrNot( categoriesList[index] );
                    },
                    
                    );
                })),
        // add 
        // floatingActionButton: FloatingItemsAndSettingItemWidget(
        //   onPressed: () {
        //     NavigationService.pushNamed(AppRouter.addEditCategoriesRoute);
        //   },
        // )
        
        );
  }
}
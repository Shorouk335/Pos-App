import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/modifier_model.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/modifiers/widget/modifier_app_bar_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/modifiers/widget/modifiers_item_list_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/empty_sales_item_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/floating_sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/loadingAndError.dart';
import 'package:flutter/material.dart';

class ModifiersView extends StatefulWidget {
  const ModifiersView({super.key});

  @override
  State<ModifiersView> createState() => _ModifiersViewState();
}

class _ModifiersViewState extends State<ModifiersView> {
   ///////////logic for try only  /////////////
   List<ModifierModel> modifierList= [
    ModifierModel(name: "modifier 1", isSelected: false),
    ModifierModel(name: "modifier 2", isSelected: false),
    ModifierModel(name: "modifier 3", isSelected: false),
    ModifierModel(name: "modifier 4", isSelected: false),
  ];

  selectModifierOrNot(ModifierModel item) {
    setState(() {
      item.isSelected = !item.isSelected!;
    });
  }

  deleteModifiers() {
    modifierList.removeWhere((item) => item.isSelected == true);
    setState(() {});
  }

  int getNumberOfSelectedModifier() {
    int count = 0;
    for (int i = 0; i < modifierList.length; i++) {
      if (modifierList[i].isSelected == true) {
        count++;
      }
    }
    return count;
  }

  bool isSelectedOrNotModifier() {
    return modifierList.any((element) => element.isSelected == true);
  }

  removeSelectMode() {
    for (var element in modifierList) {
      element.isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:   ModifierAppBarWidget(
          typeName: getNumberOfSelectedModifier() == 1 ? "modifier" : "modifiers",
          isNormalAppBar: isSelectedOrNotModifier(),
          count: getNumberOfSelectedModifier(),
          onDeletePressed: deleteModifiers,
          onBackPressed: removeSelectMode,
        ),
        body: LoadingAndError(
            isLoading: false,
            isError: modifierList.isEmpty,
            errorWidget: const EmptySalesItemWidget(
              salesItemType: SalesItemType.modifiers,
            ),
            child: ListView.builder(
                itemCount: modifierList.length,
                itemBuilder: (context, index) {
                  return ModifiersItemListWidget(
                    modifier: modifierList[index],
                    onLongPress: () {
                      selectModifierOrNot(modifierList[index]);
                    },
                    
                    );
                })),
        floatingActionButton: FloatingItemsAndSettingItemWidget(
          onPressed: () {
            NavigationService.pushNamed(AppRouter.addEditModifiersRoute) ;
          },
        ));
  }
}
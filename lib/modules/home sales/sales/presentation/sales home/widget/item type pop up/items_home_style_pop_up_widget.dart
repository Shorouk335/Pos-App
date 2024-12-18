import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/item%20type%20pop%20up/item_type_pop_box_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/manager/item_home_style_service.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsHomeStyleMenuPopUpWidget extends StatefulWidget {
  const ItemsHomeStyleMenuPopUpWidget({
    super.key,
  });

  @override
  State<ItemsHomeStyleMenuPopUpWidget> createState() =>
      _ItemsHomeStyleMenuPopUpWidgetState();
}

class _ItemsHomeStyleMenuPopUpWidgetState
    extends State<ItemsHomeStyleMenuPopUpWidget> {
  List<PopupMenuItem<String>> categoriesList() => List.generate(3, (index) {
        return PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          value: "category ${index + 1}",
          child: ItemTypeBoxPopWidget(
            title: "category ${index + 1}",
            onTap: () {
              SalesCubit.get(context).changeShowTypeItems(
                  ItemHomeStyle.byCategory, "category ${index + 1}");
            },
            isSelected: SalesCubit.get(context).itemPopUpSelect ==
                    "category ${index + 1}"
                ? true
                : false,
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return PopupMenuButton<String>(
          iconColor: AppColors.normalTextGrey(context),
          padding: EdgeInsets.zero,
          color: AppColors.backgroundColorMode(context),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                value: "all_items",
                child: ItemTypeBoxPopWidget(
                  title: "all_items".tr(),
                  onTap: () {
                    cubit.changeShowTypeItems(
                        ItemHomeStyle.normal, "all_items");
                  },
                  isSelected:
                      cubit.itemPopUpSelect == "all_items" ? true : false,
                )),
            PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                value: "favorite",
                child: ItemTypeBoxPopWidget(
                  title: "favorite".tr(),
                  onTap: () {
                    cubit.changeShowTypeItems(
                        ItemHomeStyle.favorite, "favorite");
                  },
                  isSelected:
                      cubit.itemPopUpSelect == "favorite" ? true : false,
                )),
            PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                value: "discount",
                child: ItemTypeBoxPopWidget(
                  title: "discount".tr(),
                  onTap: () {
                    cubit.changeShowTypeItems(
                        ItemHomeStyle.discount, "discount");
                  },
                  isSelected:
                      cubit.itemPopUpSelect == "discount" ? true : false,
                )),
            ...categoriesList()
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                context: context,
                text: cubit.itemPopUpSelect.tr(),
              ),
              const Icon(Icons.arrow_drop_down_sharp)
            ],
          ),
        );
      },
    );
  }
}

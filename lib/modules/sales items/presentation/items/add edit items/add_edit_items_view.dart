import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/sort%20by/sort_by_item_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_break_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_modifiers_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_select_color_and_shape_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_select_image_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/text_switch_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/add%20sales%20item/cancel_changed_add_sales_item_dialog.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/auto_complate.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddEditItemsView extends StatefulWidget {
  const AddEditItemsView({super.key, this.item});
  final ItemModel? item;

  @override
  State<AddEditItemsView> createState() => _AddEditItemsViewState();
}

class _AddEditItemsViewState extends State<AddEditItemsView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isClickSwitch = true;
  bool isShapeAndColor = true;
  bool isImage = false;

  changeFromShapeToColor() {
    setState(() {
      isShapeAndColor = !isShapeAndColor;
      isImage = !isImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.backgroundGray(context),
        appBar: CustomDarkAppBar(
          onBackPressed: widget.item == null
              ? () {
                  // if user add value in screen only
                  showCancelChangedAddSalesItemDialog(context);
                }
              : null,
          title: widget.item == null ? "add_item".tr() : "edit_item".tr(),
          actions: [
            TextButton(
                onPressed: () {
                  NavigationService.popPage();
                },
                child: CustomText(
                  context: context,
                  text: "save".tr(),
                  type: TextType.textButton,
                ))
          ],
        ),
        body: ListView(
          children: [
            Container(
              color: AppColors.backgroundColorMode(context),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      initialValue: widget.item?.name ?? "",
                      labelText: "name".tr(),
                      contentPadding: EdgeInsets.zero,
                      validator: CustomValidation.normalValidation,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomAutoCompleteTextField<String>(
                      lable: "category".tr(),
                      initialValue: "no_category".tr(),
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      contentPadding: EdgeInsets.zero,
                      showRequiredStar: false,
                      onChanged: (s) {},
                      itemAsString: (p0) => p0,
                      function: (s) async => [
                        "all_items".tr(),
                        "category1",
                        "category1",
                        "category1",
                        "category1"
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomText(context: context, text: "sold_by".tr()),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SortByItemWidget(
                      title: "each".tr(),
                      isSelected: true,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SortByItemWidget(
                      title: "weight".tr(),
                      isSelected: false,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      labelText: "price".tr(),
                      contentPadding: EdgeInsets.zero,
                    ),
                    CustomText(
                      context: context,
                      text: "price_txt".tr(),
                      type: TextType.description,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomTextFormField(
                      labelText: "SKU",
                      initialValue: "10014",
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextFormField(
                      labelText: "barcode".tr(),
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              color: AppColors.backgroundColorMode(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      context: context,
                      text: "inventory".tr(),
                      color: AppColors.primary(context),
                    ),
                    TextSwitchWidget(
                        title: "track_stock".tr(),
                        isClickSwitch: isClickSwitch,
                        onChanged: (value) {
                          setState(() {
                            isClickSwitch = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
            color: AppColors.backgroundColorMode(context) , 
              child: const BoxModifiersWidget()),
            SizedBox(
              height: 25.0,
            ),
            Container(
              color: AppColors.backgroundColorMode(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      context: context,
                      text: "representation_on_pos".tr(),
                      color: AppColors.primary(context),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SortByItemWidget(
                      title: "color_and_shape".tr(),
                      isSelected: isShapeAndColor,
                      onTap: () {
                        changeFromShapeToColor();
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SortByItemWidget(
                      title: "image".tr(),
                      isSelected: isImage,
                      onTap: () {
                        changeFromShapeToColor();
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Visibility(
                      visible: isShapeAndColor,
                      replacement: const BoxSelectImageWidget(),
                      child: const BoxSelectColorAndShapeWidget(),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
                if (widget.item != null)
              SizedBox(
              height: 20.0,
            ),
            if (widget.item != null)
              CustomButton(
                  backgroundColor: AppColors.backgroundColorMode(context),
                  radius: 0.0,
                  textColor: AppColors.textNormalColor(context),
                  icon: Icons.delete,
                  iconColor: AppColors.normalTextGrey(context),
                  onPressed: () {},
                  text: "delete_item".tr()),
                    if (widget.item != null)
              SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

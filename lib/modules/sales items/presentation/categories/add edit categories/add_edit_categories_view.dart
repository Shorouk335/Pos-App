import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_break_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/box_select_color_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/add%20sales%20item/cancel_changed_add_sales_item_dialog.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddEditCategoriesView extends StatefulWidget {
  const AddEditCategoriesView({super.key, this.name});
  final String? name;

  @override
  State<AddEditCategoriesView> createState() => _AddEditCategoriesViewState();
}

class _AddEditCategoriesViewState extends State<AddEditCategoriesView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray(context),
      appBar: CustomDarkAppBar(
        onBackPressed: widget.name == null
            ? () {
                // if user add value in screen only
                showCancelChangedAddSalesItemDialog(context);
              }
            : null,
        title:
            widget.name == null ? "create_category".tr() : "edit_category".tr(),
        actions: [
          TextButton(
              onPressed: () {},
              child: CustomText(context: context,
                text: "save".tr(),
                type: TextType.textButton,
              ))
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              color: AppColors.backgroundColorMode(context),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      initialValue: widget.name ?? "",
                      labelText: "category_name".tr(),
                      contentPadding: EdgeInsets.zero,
                      validator: CustomValidation.normalValidation,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomText(context: context,
                      text: "category_color".tr(),
                      color: AppColors.primary(context),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const BoxSelectColorWidget(),
                  ],
                ),
              ),
            ),
           SizedBox(height: 20.0,), 
           
            Container(
                color: AppColors.backgroundColorMode(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 15.0),
                child: Column(
                  children: [
                    CustomOutlineButton(
                        radius: 0.0,
                        onPressed: () {
                          NavigationService.pushNamed(
                              AppRouter.assignItemToPageRoute , 
                              extra: false
                              
                              );
                        },
                        text: "assign_item".tr()),
                  SizedBox(height: 15.0,), 
                  CustomOutlineButton(
                    radius: 0.0,
                    onPressed: () {
                      NavigationService.pushNamed(AppRouter.addEditItemsRoute);
                    },
                    text: "create_item".tr()),
                  
                  ],
                ),
              ),
            ),
           
             if (widget.name != null)
              SizedBox(
              height: 20.0,
            ),
      
            if (widget.name != null)
              Container(
                  color: AppColors.backgroundColorMode(context),
                child: CustomButton(
                    backgroundColor: AppColors.backgroundColorMode(context),
                    radius: 0.0,
                    textColor: AppColors.textNormalColor(context),
                    icon: Icons.delete,
                    iconColor: AppColors.normalTextGrey(context),
                    onPressed: () {},
                    text: "delete_category".tr()),
              ),
              
             if (widget.name != null)
              SizedBox(
              height: 20.0,
            ),
           
          ],
        ),
      ),
    );
  }
}

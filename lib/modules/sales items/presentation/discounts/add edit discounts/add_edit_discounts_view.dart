import 'package:e_ticket_app/core/app_utils/utils.dart';
import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/discounts/add%20edit%20discounts/widget/box_discount_amount_type_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/add%20sales%20item/cancel_changed_add_sales_item_dialog.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddEditDiscountsView extends StatefulWidget {
  const AddEditDiscountsView({super.key, required this.discount});
  final DiscountModel? discount;

  @override
  State<AddEditDiscountsView> createState() => _AddEditDiscountsViewState();
}

class _AddEditDiscountsViewState extends State<AddEditDiscountsView> {
  DiscountModel discountModel = DiscountModel();
  bool isValueSelected = false;

  @override
  initState() {
    super.initState();
    if (widget.discount != null) {
      discountModel = widget.discount ?? DiscountModel();
      isValueSelected = widget.discount?.isPercentage == true ? false : true;
    }
  }

  transformFromValueToPercentage() {
    isValueSelected = !isValueSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray(context),
      appBar: CustomDarkAppBar(
        onBackPressed: widget.discount == null
            ? () {
                // if user add value in screen only
                showCancelChangedAddSalesItemDialog(context);
              }
            : null,
        title: widget.discount == null
            ? "create_discount".tr()
            : "edit_discount".tr(),
        actions: [
          TextButton(
              onPressed: () {
                discountModel.isPercentage = isValueSelected ? false : true;
                discountModel.uuid ??= Utils.getId();
                HiveService.addDiscountToDB(discountModel);
                Navigator.of(context).pop("change");
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
                children: [
                  CustomTextFormField(
                    initialValue: discountModel.name ?? "",
                    labelText: "name".tr(),
                    contentPadding: EdgeInsets.zero,
                    validator: CustomValidation.normalValidation,
                    onChanged: (s) {
                      discountModel.name = s;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              initialValue: discountModel.value != null
                                  ? discountModel.value.toString()
                                  : "",
                              labelText: "value".tr(),
                              contentPadding: EdgeInsets.zero,
                              validator: CustomValidation.normalValidation,
                              onChanged: (s) {
                                discountModel.value = 
                                     double.tryParse(s); 
                                    
                              },
                            ),
                            CustomText(
                              context: context,
                              text: "price_txt".tr(),
                              type: TextType.description,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      BoxDiscountAmountTypeWidget(
                        isValueSelected: isValueSelected,
                        onTap: transformFromValueToPercentage,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (widget.discount != null)
            SizedBox(
              height: 20.0,
            ),
          if (widget.discount != null)
            Container(
              color: AppColors.backgroundColorMode(context),
              child: CustomButton(
                  backgroundColor: AppColors.backgroundColorMode(context),
                  radius: 0.0,
                  textColor: AppColors.textNormalColor(context),
                  icon: Icons.delete,
                  iconColor: AppColors.normalTextGrey(context),
                  onPressed: () async {
                    await HiveService.clearDiscountList(
                        <String>[widget.discount!.uuid!]);
                    Navigator.of(context).pop("change");
                  },
                  text: "delete_discount".tr()),
            ),
          if (widget.discount != null)
            SizedBox(
              height: 20.0,
            ),
        ],
      ),
    );
  }
}

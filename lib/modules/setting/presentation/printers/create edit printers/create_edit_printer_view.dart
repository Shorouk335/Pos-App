import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/text_switch_widget.dart';
import 'package:e_ticket_app/modules/setting/domain/model/setting_item_model.dart';
import 'package:e_ticket_app/modules/setting/presentation/printers/create%20edit%20printers/widget/printer_model_pop_up_widget.dart';
import 'package:e_ticket_app/modules/setting/presentation/widget/empty_setting_type_widget.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateEditPrinterView extends StatefulWidget {
  const CreateEditPrinterView({super.key, required this.settingItemModel});
  final SettingItemModel? settingItemModel;

  @override
  State<CreateEditPrinterView> createState() => _CreateEditPrinterViewState();
}

class _CreateEditPrinterViewState extends State<CreateEditPrinterView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool printReceiptsAndBillsClick = false;
  bool printOrdersClick = false;
  bool automaticallyPrintReceiptClick = false;
  bool printSingleItemPerOrderTicketClick = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.backgroundGray(context),
        appBar: CustomDarkAppBar(
          title: widget.settingItemModel == null
              ? "create_printer".tr()
              : "edit_printer".tr(),
          actions: [
            TextButton(
                onPressed: () {},
                child: CustomText(context: context,
                  text: "save".tr(),
                  type: TextType.textButton,
                ))
          ],
        ),
        body: ListView(
          children: [
            Container(
              color: AppColors.backgroundColorMode(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          initialValue: widget.settingItemModel?.name ?? "",
                          labelText: "name".tr(),
                          contentPadding: EdgeInsets.zero,
                          validator: CustomValidation.normalValidation,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomText(context: context,
                          text: "printer_model".tr(),
                          type: TextType.description,
                          size: 18.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const PrinterModelPopUpWidget(),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        TextSwitchWidget(
                            title: "print_receipts_and_bills".tr(),
                            isClickSwitch: printReceiptsAndBillsClick,
                            onChanged: (value) {
                              setState(() {
                                printReceiptsAndBillsClick = value;
                              });
                            }),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextSwitchWidget(
                            title: "print_orders".tr(),
                            isClickSwitch: printOrdersClick,
                            onChanged: (value) {
                              setState(() {
                                printOrdersClick = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  const Divider(),
                  Visibility(
                      visible: printReceiptsAndBillsClick,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextSwitchWidget(
                            title: "automatically_print_receipt".tr(),
                            isClickSwitch: automaticallyPrintReceiptClick,
                            onChanged: (value) {
                              setState(() {
                                automaticallyPrintReceiptClick = value;
                              });
                            }),
                      )),
                  Visibility(
                      visible: printOrdersClick,
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextSwitchWidget(
                              title: "print_single_item_per_order_ticket".tr(),
                              isClickSwitch: printSingleItemPerOrderTicketClick,
                              onChanged: (value) {
                                setState(() {
                                  printSingleItemPerOrderTicketClick = value;
                                });
                              }))),
                  Visibility(
                      visible: printReceiptsAndBillsClick || printOrdersClick,
                      child: const Divider()),
                  CustomButton(
                      backgroundColor: AppColors.backgroundColorMode(context),
                      radius: 0.0,
                      textColor: AppColors.textNormalColor(context),
                      icon: Icons.print,
                      iconColor: AppColors.normalTextGrey(context),
                      onPressed: () {},
                      text: "print_test".tr()),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: printOrdersClick,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                color: AppColors.backgroundColorMode(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(context: context,
                      text: "printer_groups".tr(),
                      type: TextType.big,
                    ),
                    const EmptySettingTypeWidget(
                        settingType: SettingType.printerGroup),
                  ],
                ),
              ),
            ),
            Visibility(
              visible:  widget.settingItemModel != null,
              child: const SizedBox(
                height: 20.0,
              ),
            ), 
            Visibility(
              visible: widget.settingItemModel != null,
              child: CustomButton(
                  backgroundColor: AppColors.backgroundColorMode(context),
                  radius: 0.0,
                  textColor: AppColors.textNormalColor(context),
                  icon: Icons.delete,
                  iconColor: AppColors.normalTextGrey(context),
                  onPressed: () {},
                  text: "delete_printer".tr()),
            ) , 
              Visibility(
              visible: widget.settingItemModel != null,
              child: const SizedBox(
                height: 20.0,
              ),
            ), 
          ],
        ),
      ),
    );
  }
}

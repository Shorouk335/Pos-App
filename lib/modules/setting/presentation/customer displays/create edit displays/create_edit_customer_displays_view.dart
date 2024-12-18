import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/items/add%20edit%20items/widget/text_switch_widget.dart';
import 'package:e_ticket_app/modules/setting/domain/model/setting_item_model.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateEditCustomerDisplaysView extends StatefulWidget {
  const CreateEditCustomerDisplaysView(
      {super.key, required this.settingItemModel});
  final SettingItemModel? settingItemModel;

  @override
  State<CreateEditCustomerDisplaysView> createState() =>
      _CreateEditCustomerDisplaysViewState();
}

class _CreateEditCustomerDisplaysViewState
    extends State<CreateEditCustomerDisplaysView> {
  bool isUseDarkThemeClick = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: AppColors.backgroundGray(context),
        appBar: CustomDarkAppBar(
          title: widget.settingItemModel == null
              ? "create_customer_display".tr()
              : "edit_customer_display".tr(),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          initialValue: widget.settingItemModel?.name ?? "",
                          labelText: "name".tr(),
                         
                          contentPadding: EdgeInsets.zero,
                          validator: CustomValidation.normalValidation,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                labelText: "customer_display_ip_address".tr(),
                              
                                contentPadding: EdgeInsets.zero,
                                validator: CustomValidation.normalValidation,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            CustomButton(
                                height: 50.0,
                                radius: 0.0,
                                onPressed: () {},
                                text: "search".tr())
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
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
                            title: "use_dark_theme".tr(),
                            isClickSwitch: isUseDarkThemeClick,
                            onChanged: (value) {
                              setState(() {
                                isUseDarkThemeClick = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  const Divider(),
                  CustomButton(
                      backgroundColor: AppColors.backgroundColorMode(context),
                      radius: 0.0,
                      textColor: AppColors.textNormalColor(context),
                      icon: Icons.wifi,
                      iconColor: AppColors.normalTextGrey(context),
                      onPressed: () {},
                      text: "pair".tr()),
                ],
              ),
            ) , 
            const SizedBox(height: 20.0,) , 
             Visibility(
              visible: widget.settingItemModel != null,
              child: CustomButton(
                        backgroundColor: AppColors.backgroundColorMode(context),
                        radius: 0.0,
                        textColor: AppColors.textNormalColor(context),
                        icon: Icons.delete,
                        iconColor: AppColors.normalTextGrey(context),
                        onPressed: () {},
                        text: "delete_customer_display".tr()),
            ),
          ],
        ),
      ),
    );
  }
}

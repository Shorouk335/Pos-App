import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/setting/domain/model/setting_item_model.dart';
import 'package:e_ticket_app/modules/setting/presentation/taxes/create%20edit%20tax/widget/tax_pop_up_menu_widget.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateEditTaxesView extends StatefulWidget {
  const CreateEditTaxesView({super.key , required this.settingItemModel});
  final SettingItemModel? settingItemModel ; 

  @override
  State<CreateEditTaxesView> createState() => _CreateEditTaxesViewState();
}

class _CreateEditTaxesViewState extends State<CreateEditTaxesView> {
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
              ? "create_tax".tr()
              : "edit_tax".tr(),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        CustomTextFormField(
                          labelText: "tax_rate_%".tr(),
                          contentPadding: EdgeInsets.zero,
                          validator: CustomValidation.normalValidation,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                         CustomText(context: context,
                          text: "type".tr(),
                          type: TextType.description,
                          size: 20.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                         const TaxPopUpMenuWidget() , 
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomOutlineButton(
                  radius: 0.0,
                  onPressed: () {
                    NavigationService.pushNamed(AppRouter.assignItemToPageRoute , extra: true);
                  },
                  text: "apply_to_item".tr()),
                      ],
                    ),
                  ),
               
                 
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
                        text: "delete_tax".tr()),
            ),
          
          
          ],
        ),
      ),
    ); }
}
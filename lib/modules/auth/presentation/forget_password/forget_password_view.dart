import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(
        title: "forget_password".tr(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(context: context,
                  text: "enter_email_to_receive_code".tr() , 
                  type: TextType.big,
                  isWeight: true,
                  
                  ),
                  const SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField(
                  labelText: "email".tr(),
                  suffixWidget:   Icon(
                    Icons.email_outlined , 
                      color: AppColors.normalTextGrey(context),
                      size: 25.0,
                    ),
                 
                  validator: CustomValidation.emailValidation,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                CustomButton(
                    onPressed: () {
                      NavigationService.pushNamed(AppRouter.verificationRoute);
                    },
                    text: "send".tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

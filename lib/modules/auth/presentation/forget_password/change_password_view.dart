import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/router/router.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
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
                  text: "reset_password".tr() , 
                  type: TextType.big,
                  isWeight: true,
                  
                  ),
                  const SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField( 
                    isPassword: true,
                    obscureText: true,
                    labelText: "new_password".tr(),
                     validator: CustomValidation.newPasswordValidation,
                    ),
                const SizedBox(
                  height: 50.0,
                ),
                CustomButton(
                    onPressed: () { 
                      NavigationService.goNamed(AppRouter.layoutRoute);

                    },
                    text: "confirm".tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
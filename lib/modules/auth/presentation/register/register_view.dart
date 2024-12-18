import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(
        title: "register".tr(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "email".tr(),
                  suffixWidget: Icon(
                    Icons.email_outlined,
                    color: AppColors.normalTextGrey(context),
                    size: 25.0,
                  ),
                  validator: CustomValidation.emailValidation,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField(
                  labelText: "password".tr(),
                  isPassword: true,
                  obscureText: true,
                  validator: CustomValidation.passwordValidation,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField(
                  labelText: "work_name".tr(),
                  suffixWidget: Icon(
                    Icons.work_outline,
                    color: AppColors.normalTextGrey(context),
                    size: 25.0,
                  ),
                  validator: CustomValidation.workValidation,
                ),
                const SizedBox(
                  height: 80.0,
                ),
                CustomButton(
                    onPressed: () {
                      NavigationService.goNamed(AppRouter.layoutRoute);
                    },
                    text: "register".tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

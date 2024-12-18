import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmailReceiptView extends StatefulWidget {
  const EmailReceiptView({super.key});

  @override
  State<EmailReceiptView> createState() => _EmailReceiptViewState();
}

class _EmailReceiptViewState extends State<EmailReceiptView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isIgnoreBottom = true;
  checkIgnoreButtonOrNot() {
    isIgnoreBottom = formKey.currentState!.validate() ? false : true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: "enter_email".tr(),
        actions: [
          IgnorePointer(
            ignoring: isIgnoreBottom,
            child: TextButton(
                onPressed: () {
                  NavigationService.popPage();
                },
                child: IgnorePointer( 
                  ignoring: isIgnoreBottom,
                  child: CustomText(context: context,
                    text: "send".tr(),
                    type: TextType.big,
                    color: isIgnoreBottom
                        ? AppColors.greyBorder
                        :AppColors.primary(context) ,
                  ),
                )),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomTextFormField(
            labelText: "email".tr(),
            onChanged: (s){ 
               checkIgnoreButtonOrNot();
              if (s == ""){
                isIgnoreBottom = true ;
                setState(() {
                  
                });
              }
            },
            validator: CustomValidation.emailValidation,
          ),
        ),
      ),
    );
  }
}

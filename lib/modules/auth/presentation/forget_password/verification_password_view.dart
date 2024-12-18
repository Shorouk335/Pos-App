
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:easy_localization/easy_localization.dart' as l;
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationPasswordView extends StatefulWidget {
  const VerificationPasswordView({super.key});

  @override
  State<VerificationPasswordView> createState() =>
      _VerificationPasswordViewState();
}

class _VerificationPasswordViewState
    extends State<VerificationPasswordView> {
  String? code;
  bool errorBorder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(
        title: "forget_password".tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(context: context,
                text: "enter_the_confirmation_code_sent".tr(),
                type: TextType.big,
                isWeight: true,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                        constraints: const BoxConstraints.expand(),
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: errorBorder
                                    ? Colors.red
                                    : Colors.grey.withOpacity(0.6),
                                width: 0.5),
                            borderRadius: BorderRadius.circular(15.0)),
                        textStyle:  TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.normalTextGrey(context))),
                    onCompleted: (pin) {
                      setState(() {
                        errorBorder = false;
                      });
                      NavigationService.pushNamed(
                          AppRouter.changePasswordRoute);
                    },
                    onChanged: (value) {
                      code = value;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              CustomButton(
                  onPressed: () {
                    if (code?.length == 6) {
                      NavigationService.pushNamed(
                          AppRouter.changePasswordRoute);
                    } else {
                      setState(() {
                        errorBorder = true;
                      });
                    }
                  },
                  text: "confirm".tr()),
            ],
          ),
        ),
      ),
    );
  }
}

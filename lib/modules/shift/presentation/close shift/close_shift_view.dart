import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/shift/presentation/widget/cash_shift_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CloseShiftView extends StatefulWidget {
  const CloseShiftView({super.key});

  @override
  State<CloseShiftView> createState() => _CloseShiftViewState();
}

class _CloseShiftViewState extends State<CloseShiftView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: "close_shift".tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CashShiftItemWidget(
                title: "expected_cash_amount".tr(), amount: "EGP 0.00"),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  CustomText(context: context,text: "actual_cash_amount".tr()),
                  const Spacer(),
                  SizedBox(
                    width: 75,
                    child: CustomTextFormField(
                      hintText: "EGP 0.00",
                      hintStyle:getTextStyle( 
                        context , 
                        TextType.description,
                          color: AppColors.normalTextGrey(context)) ,
                      textStyle: getTextStyle( 
                        context , 
                        TextType.description,
                          color: AppColors.normalTextGrey(context)),
                      contentPadding: EdgeInsets.zero,
                      onChanged: (s) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CashShiftItemWidget(title: "difference".tr(), amount: "EGP 0.00"),
            const SizedBox(
              height: 25.0,
            ),
            CustomOutlineButton(
              radius: 0.0,
              onPressed: () {
                Navigator.of(context).pop("openShift");
              },
              text: "close_shift".tr(),
              textSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}

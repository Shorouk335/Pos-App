import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplitChargeButtonsWidget extends StatelessWidget {
  const SplitChargeButtonsWidget({super.key , required this.splitNumber , required this.onDecreaseTap , required this.onIncreaseTap });
   final int splitNumber ;
   final void Function()? onDecreaseTap ;
   final void Function()? onIncreaseTap ;
  @override
  Widget build(BuildContext context) {
    return   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IgnorePointer(
                  ignoring: splitNumber < 2,
                  child: InkWell(
                    onTap:onDecreaseTap , 
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      padding: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.greyBorder, width: 1.0),
                      ),
                      child: Center(
                          child: CustomText(context: context,
                        text: "__",
                        color: splitNumber < 2
                            ? Colors.grey.shade300
                            : AppColors.normalTextGrey(context),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                const Divider(),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(context: context,
                      text: splitNumber.toString(),
                      size: 30.0,
                    ),
                    CustomText(context: context,
                      text: "payments".tr(),
                      type: TextType.description,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30.0,
                ),
                IgnorePointer(
                  ignoring: false,
                  child: InkWell(
                    onTap: onIncreaseTap , 
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.greyBorder, width: 1.0),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: false
                            ? Colors.grey.shade300
                            : AppColors.normalTextGrey(context),
                        size: 30.0,
                      )),
                    ),
                  ),
                ),
              ],
            );
  }
}
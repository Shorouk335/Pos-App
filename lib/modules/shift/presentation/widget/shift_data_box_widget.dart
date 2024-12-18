import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShiftDataBoxWidget extends StatelessWidget {
  const ShiftDataBoxWidget({super.key , required this.openShiftDate , required this.openShiftName , required this.shiftNumber});
  final String shiftNumber ; 
  final String openShiftName ; 
  final String openShiftDate ; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(context: context,
              text: "shift_number".tr(),
            ),
             CustomText(context: context,
              text: " : ",
            ),
             CustomText(context: context,
              text: shiftNumber,
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomText(context: context,
                  text: "shift_opened".tr(),
                ),
                 CustomText(context: context,
                  text: " : ",
                ),
                 CustomText(context: context,
                  text: openShiftName,
                ),
              ],
            ),
             CustomText(context: context,
              text: openShiftDate,
            ),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

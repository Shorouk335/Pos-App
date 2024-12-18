import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditItemSalaryButtonWidget extends StatefulWidget {
  const EditItemSalaryButtonWidget(
      {super.key,
      required this.count,
      required this.onChanged,
      required this.onDecreaseTap,
      required this.onIncreaseTap});
  final TextEditingController count;
  final void Function()? onIncreaseTap;
  final void Function()? onDecreaseTap;
  final void Function(String)? onChanged;

  @override
  State<EditItemSalaryButtonWidget> createState() =>
      _EditItemSalaryButtonWidgetState();
}

class _EditItemSalaryButtonWidgetState
    extends State<EditItemSalaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: widget.onDecreaseTap,
          child: Container(
            height: 50.0,
            width: 50.0,
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(color: AppColors.normalTextGrey(context), width: 1.0),
            ),
            child:  Center(
                child: CustomText(context: context,
              text: "__",
              color: AppColors.normalTextGrey(context),
            )),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: CustomTextFormField(
              keybordType: TextInputType.number,
              textAlign: TextAlign.center,
              textController: widget.count,
              // textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
              onChanged: widget.onChanged),
        ),
        const SizedBox(
          width: 15.0,
        ),
        InkWell(
          onTap: widget.onIncreaseTap,
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              border: Border.all(color: AppColors.normalTextGrey(context), width: 1.0),
            ),
            child:  Center(
                child: Icon(
              Icons.add,
              color: AppColors.normalTextGrey(context),
              size: 30.0,
            )),
          ),
        ),
      ],
    );
  }
}

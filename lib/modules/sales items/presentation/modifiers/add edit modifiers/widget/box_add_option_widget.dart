import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';

class BoxAddOptionWidget extends StatelessWidget {
  const BoxAddOptionWidget({super.key, required this.option , required this.onDeletePressed});
  final String option;
  final void Function()? onDeletePressed  ; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        color: AppColors.backgroundColorMode(context),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Handle(
            delay: Duration(milliseconds: 0),
            capturePointer: true,
            child: Icon(
              Icons.drag_handle,
              color: Colors.grey,
            ),
          ),
          title: Column(
            children: [
              CustomTextFormField(
                labelText: "option_name".tr(),
                contentPadding: EdgeInsets.zero,
                validator: CustomValidation.normalValidation,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextFormField(
                initialValue: "0.00",
                labelText: "price".tr(),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: onDeletePressed,
            icon: const Icon(Icons.delete),
            color: AppColors.normalTextGrey(context),
          ),
        ),
      ),
    );
  }
}

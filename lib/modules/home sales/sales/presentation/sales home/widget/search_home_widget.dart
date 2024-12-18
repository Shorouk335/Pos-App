import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget({super.key , required this.onPressed});
  final void Function()? onPressed ; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    height: 60,
                    child: CustomTextFormField(
                      hintText: "search".tr(),
                      suffixWidget: IconButton(
                        onPressed: onPressed , 
                        icon: Icon(
                          Icons.close,
                          color: AppColors.normalTextGrey(context),
                          size: 20.0,
                        ),
                      ),
                      aroundPadding: EdgeInsets.zero,
                      isSearch: true,
                      onChanged: (s) {},
                    ),
                  );
  }
}
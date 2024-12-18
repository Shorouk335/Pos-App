import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'customText.dart';

class LoadingAndError extends StatelessWidget {
  const LoadingAndError(
      {super.key,
      required this.isLoading,
      required this.isError,
      required this.child,
      this.loadingWidget,
      this.errorWidget});
  final bool isError;
  final bool isLoading;
  final Widget child;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingWidget ??
           Center(
            child: CircularProgressIndicator(
              color: AppColors.primary(context),
            ),
          );
    } else if (isError) {
      return errorWidget ??
          Center(
            child: CustomText(context: context,
              text: "there_is_no_data".tr(),
              type: TextType.title,
            ),
          );
    } else {
      return child;
    }
  }
}

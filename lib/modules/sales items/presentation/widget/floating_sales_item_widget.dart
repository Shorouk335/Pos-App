import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FloatingItemsAndSettingItemWidget extends StatelessWidget {
  const FloatingItemsAndSettingItemWidget({super.key , this.onPressed});
  final void Function()? onPressed ; 

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton( 
        shape: const CircleBorder(), 
        backgroundColor: AppColors.primary(context),
        onPressed: onPressed,
        child:  Icon(Icons.add , color: AppColors.backgroundColorMode(context), size: 30.0,));
  }
}
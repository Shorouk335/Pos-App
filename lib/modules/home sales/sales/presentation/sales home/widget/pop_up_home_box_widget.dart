import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/item%20type%20pop%20up/items_home_style_pop_up_widget.dart';
import 'package:flutter/material.dart';

class PopUpHomeBoxWidget extends StatelessWidget {
  const PopUpHomeBoxWidget({super.key , required this.onPressed });
  final  void Function()? onPressed; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Expanded(
            child: SizedBox(height: 60, child: ItemsHomeStyleMenuPopUpWidget())),
        SizedBox(
          height: 60,
          child: VerticalDivider(
            color: AppColors.normalTextGrey(context),
          ),
        ),
        IconButton(
            onPressed: onPressed , 
            icon: Icon(
              Icons.search,
              color: AppColors.normalTextGrey(context),
            ))
      ],
    );
  }
}

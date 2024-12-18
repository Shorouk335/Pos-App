import 'package:e_ticket_app/modules/sales%20items/presentation/widget/delete%20app%20bar/delete_sales_item_app_bar_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  SettingAppBar(
      {super.key,
      required this.title , 
      this.isNormalAppBar = true,
      this.count,
      this.onDeletePressed,
      this.onBackPressed,
      this.typeName = ""});
  bool isNormalAppBar;
  String typeName;
  String title;
  int? count;
  void Function()? onDeletePressed;
  void Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isNormalAppBar,
      replacement: CustomDarkAppBar(
        title: title,
      ),
      child: DeleteItemsAndSettingsAppBarWidget(
          type: typeName,
          onBackPressed: onBackPressed,
          count: count.toString(),
          onDeletePressed: onDeletePressed),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}

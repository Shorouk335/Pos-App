import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/delete%20app%20bar/dialog_confirm_delete_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DeleteItemsAndSettingsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DeleteItemsAndSettingsAppBarWidget(
      {super.key,
      required this.count,
      required this.type,
      required this.onDeletePressed,
      required this.onBackPressed});
  final String count;
  final String type;
  final void Function()? onDeletePressed;
  final void Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return CustomLightAppBar(
      onBackPressed: onBackPressed,
      title: count,
      actions: [
        IconButton(
            onPressed: () {
              showDialogConfirmDeleteSalesItem(context, type, onDeletePressed);
            },
            icon: Icon(Icons.delete ,color: AppColors.textNormalColor(context),))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/popUp%20menu/pop_up_menu_item.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReceiptsDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReceiptsDetailsAppBar({super.key , required this.ticket});
  final TicketModel? ticket ; 

  @override
  Widget build(BuildContext context) {
    return  CustomDarkAppBar(
        title: "#1-1046",
        actions: [
          TextButton(
              onPressed: () {
                NavigationService.pushNamed(AppRouter.refundReceiptsRoute,
                    extra: ticket);
              },
              child: CustomText(context: context,
                text: "refund".tr(),
                type: TextType.textButton,
              )),
          PopupMenuButton<String>(
              iconColor: Colors.white,
              color: AppColors.backgroundColorMode(context),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'email',
                      child: PopUpMenuItemTicketWidget(
                        iconData: Icons.email,
                        title: "email_receipt".tr(),
                        isIgnoring: false,
                        onTap: () { 
                          NavigationService.pushNamed(AppRouter.emailReceiptsRoute);
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ])
        ],
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80.0);
}
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';

import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/add%20customer/add_customer_button_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/ticket%20nameAndNumber/ticket_nameAndNumber.dart';

import 'package:flutter/material.dart';

import 'popUp menu/ticket_pop_up_menu.dart';

class SalesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SalesAppBar({
    super.key,
    required this.onMenuPressed,
  });
  final void Function()? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      leadingWidth: 60.0,
      title: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            NavigationService.pushNamed(AppRouter.ticketDetailsRoute);
          },
          child: const TicketNameAndNumberWidget()),
      leading: IconButton(
        onPressed: onMenuPressed,
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      actions: const [
        AddCustomerButtonWidget(),
        TicketPopMenuWidget(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

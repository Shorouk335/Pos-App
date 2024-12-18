import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/domain/model/employee_page_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/sales_app_bar/popUp%20menu/pop_up_menu_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketPopMenuWidget extends StatelessWidget {
  const TicketPopMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return PopupMenuButton<String>(
          iconColor: Colors.white,
          color: AppColors.backgroundColorMode(context),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
                value: 'void',
                child: PopUpMenuItemTicketWidget(
                  iconData: Icons.delete,
                  title: "void_ticket".tr(),
                  isIgnoring: cubit.ticketModel.items.isNotEmpty  , 
                  onTap: () {
                    NavigationService.popPage();
                    cubit.deleteCurrentTicket();
                  },
                )),
            PopupMenuItem<String>(
                value: 'edit',
                child: PopUpMenuItemTicketWidget(
                  iconData: Icons.edit,
                  title: "edit_ticket".tr(),
                  isIgnoring: cubit.ticketModel.items.isEmpty,
                  onTap: () {
                    NavigationService.popPage();
                    NavigationService.pushNamed(AppRouter.saveTicketRoute,
                        extra: true);
                  },
                )),
            PopupMenuItem<String>(
                value: 'assign',
                child: PopUpMenuItemTicketWidget(
                  iconData: Icons.person_add_alt,
                  title: "assign_ticket".tr(),
                  isIgnoring: cubit.ticketModel.items.isEmpty,
                  onTap: () {
                    NavigationService.popPage();
                    NavigationService.pushNamed(AppRouter.employeeTicketRoute,
                        extra: EditAssignEmployeePageModel(
                            ticketModeList: <TicketModel>[cubit.ticketModel],
                            isEdit: true));
                  },
                )),
            PopupMenuItem<String>(
                value: 'merge',
                child: PopUpMenuItemTicketWidget(
                  iconData: Icons.merge_type,
                  title: "merge_ticket".tr(),
                  isIgnoring: cubit.ticketModel.items.isEmpty ||
                      HiveService.checkEmptyTicketListDB(),
                  onTap: () {
                    NavigationService.popPage();
                    cubit.ticketModel.name == null
                        ? NavigationService.pushNamed(AppRouter.saveTicketRoute,
                                extra: true)
                            .then((value) {
                            NavigationService.pushNamed(
                                AppRouter.mergeWithTicketRoute,
                                extra: cubit.ticketModel);
                          })
                        : NavigationService.pushNamed(
                            AppRouter.mergeWithTicketRoute,
                            extra: cubit.ticketModel);
                  },
                )),
            PopupMenuItem<String>(
                value: 'split',
                child: PopUpMenuItemTicketWidget(
                  iconData: Icons.call_split,
                  title: "split_ticket".tr(),
                  isIgnoring: cubit.ticketModel.items.length <= 1,
                  onTap: () async {
                    NavigationService.popPage();
                    cubit.ticketModel.name == null
                        ? NavigationService.pushNamed(AppRouter.saveTicketRoute,
                                extra: true)
                            .then((value) {
                            NavigationService.pushNamed(
                                AppRouter.splitTicketRoute,
                                extra: cubit.ticketModel.copy());
                          })
                        : NavigationService.pushNamed(
                            AppRouter.splitTicketRoute,
                            extra: cubit.ticketModel.copy());
                  },
                )),
            PopupMenuItem<String>(
                value: 'sync',
                child: PopUpMenuItemTicketWidget(
                  iconData: Icons.sync,
                  title: "sync".tr(),
                  onTap: () {
                    NavigationService.popPage();
                  },
                )),
          ],
        );
      },
    );
  }
}

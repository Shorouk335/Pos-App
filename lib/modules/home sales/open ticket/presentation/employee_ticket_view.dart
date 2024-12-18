import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/domain/model/employee_page_model.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/employee%20ticket/employee_ticket_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/employee%20ticket/employee_ticket_state.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/employee_box.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignEmployeeTicketView extends StatefulWidget {
  const AssignEmployeeTicketView(
      {super.key, required this.editAssignEmployeePageModel});
  final EditAssignEmployeePageModel editAssignEmployeePageModel;

  @override
  State<AssignEmployeeTicketView> createState() =>
      _AssignEmployeeTicketViewState();
}

class _AssignEmployeeTicketViewState extends State<AssignEmployeeTicketView> {
  TextEditingController searchController = TextEditingController();
  bool showCloseIcon = false;

  @override
  initState() {
    searchController.addListener(() {
      if (searchController.text == "") {
        showCloseIcon = false;
      } else {
        showCloseIcon = true;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeTicketCubit(),
      child: BlocConsumer<EmployeeTicketCubit, EmployeeTicketState>(
        listener: (context, state) {},
        builder: (context, state) {
          final employeeCubit = EmployeeTicketCubit.get(context);
          return SafeArea(
              child: Scaffold(
            appBar: CustomLightAppBar(title: "assign_ticket_to".tr(), actions: [
              IgnorePointer(
                ignoring: false,
                child: BlocBuilder<SalesCubit, SalesStates>(
                  builder: (context, state) {
                    final salesCubit = SalesCubit.get(context);
                    return TextButton(
                        onPressed: () {
                          if (widget.editAssignEmployeePageModel.isEdit) {
                            salesCubit.editEmployeeTicket("AAA");
                            NavigationService.popPage();
                          } else {
                            employeeCubit.transferEmployeeToTicket(widget
                                .editAssignEmployeePageModel.ticketModeList);

                            NavigationService.goNamed(AppRouter.layoutRoute);
                          }
                        },
                        child: CustomText(
                          context: context,
                          text: "transfer".tr(),
                          color: true
                              ? AppColors.primary(context)
                              : Colors.grey.withOpacity(0.4),
                        ));
                  },
                ),
              )
            ]),
            body: Column(
              children: [
                CustomTextFormField(
                  hintText: "search".tr(),
                  prefixWidget: Icon(
                    Icons.search,
                    color: AppColors.normalTextGrey(context),
                    size: 25.0,
                  ),
                  textController: searchController,
                  suffixWidget: IconButton(
                    onPressed: () {
                      searchController.text = "";
                      setState(() {});
                    },
                    icon: Icon(
                      showCloseIcon ? Icons.close : null,
                      color: AppColors.normalTextGrey(context),
                      size: 20.0,
                    ),
                  ),
                  isSearch: true,
                  contentPadding: const EdgeInsets.all(15.0),
                  onChanged: (s) {},
                ),
                Divider(), 
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ListView.separated(
                        separatorBuilder: (context, state) {
                          return const Divider();
                        },
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return const EmployeeBoxWidget();
                        }),
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}

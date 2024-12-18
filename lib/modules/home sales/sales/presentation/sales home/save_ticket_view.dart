import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveTicketView extends StatefulWidget {
  const SaveTicketView({super.key, required this.isEditName });
  final bool isEditName;

  @override
  State<SaveTicketView> createState() => _SaveTicketViewState();
}

class _SaveTicketViewState extends State<SaveTicketView> {
  late String nameTicket;
  @override
  initState() {
    nameTicket = SalesCubit.get(context).ticketModel.name ??
        "${"ticket".tr()} - ${DateTime.now().toString().timeFormateHhmm}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesCubit, SalesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SalesCubit.get(context);

        return Scaffold(
          appBar: CustomLightAppBar(
            title: "save_ticket".tr(),
            actions: [
              IgnorePointer(
                ignoring: nameTicket.isEmpty,
                child: TextButton(
                    onPressed: () {
                      widget.isEditName
                          ? cubit.editTicketName(nameTicket)
                          : cubit.saveTicketToDB(name: nameTicket);
                      NavigationService.popPage();
                    },
                    child: CustomText(context: context,
                      text: "save".tr(),
                      type: TextType.big,
                      color: nameTicket.isEmpty
                          ? AppColors.normalTextGrey(context)
                          : AppColors.primary(context),
                    )),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: "name".tr(),
                    initialValue: nameTicket,
                    onChanged: (s) {
                      setState(() {
                        nameTicket = s;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFormField(
                    labelText: "comment".tr(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

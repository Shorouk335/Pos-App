import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/open%20ticket/open_ticket_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/open%20ticket/open_ticket_states.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/sort%20by/sort_by_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortPopUpWidget extends StatefulWidget {
  const SortPopUpWidget({
    super.key,
  });

  @override
  State<SortPopUpWidget> createState() => _SortPopUpWidgetState();
}

class _SortPopUpWidgetState extends State<SortPopUpWidget> {
  String selectedItem = "name";

  changeSelectedItem(String item) {
    setState(() {
      selectedItem = item;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpenTicketCubit, OpenTicketStates>(
      builder: (context, state) {
        final cubit = OpenTicketCubit.get(context);
        return PopupMenuButton<String>(
          iconColor: AppColors.normalTextGrey(context),
          icon: const Icon(Icons.filter_list),
          color: AppColors.backgroundColorMode(context),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
                enabled: false,
                value: 'sort_by',
                child: CustomText(context: context,
                  text: "sort_by".tr(),
                  color: AppColors.normalTextGrey(context),
                  size: 15.0,
                )),
            PopupMenuItem<String>(
              value: 'name',
              child: SortByItemWidget(
                onTap: () {
                  changeSelectedItem("name");
                  cubit.sortByName();
                },
                title: "name".tr(),
                isSelected: selectedItem == "name" ? true : false,
              ),
            ),
            PopupMenuItem<String>(
              value: 'amount',
              child: SortByItemWidget(
                onTap: () {
                  changeSelectedItem("amount");
                  cubit.sortByAmount();
                },
                title: "amount".tr(),
                isSelected: selectedItem == "amount" ? true : false,
              ),
            ),
            PopupMenuItem<String>(
              value: 'time',
              child: SortByItemWidget(
                onTap: () {
                  changeSelectedItem("time");
                  cubit.sortByTime();
                },
                title: "time".tr(),
                isSelected: selectedItem == "time" ? true : false,
              ),
            ),
            PopupMenuItem<String>(
              value: 'employee',
              child: SortByItemWidget(
                onTap: () {
                  changeSelectedItem("employee");
                  cubit.sortByEmployee();
                },
                title: "employee".tr(),
                isSelected: selectedItem == "employee" ? true : false,
              ),
            ),
          ],
        );
      },
    );
  }
}

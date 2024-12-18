import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/constant/constant.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/widget/item%20type%20pop%20up/item_type_pop_box_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketTypePopUpWidget extends StatefulWidget {
  const TicketTypePopUpWidget({
    super.key,
  });

  @override
  State<TicketTypePopUpWidget> createState() => _TicketTypePopUpWidgetState();
}

class _TicketTypePopUpWidgetState extends State<TicketTypePopUpWidget> {
  String selectedItem = kDineIn;

  changeSelectedItem(String item) {
    setState(() {
      selectedItem = item;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return PopupMenuButton<String>(
          iconColor: AppColors.normalTextGrey(context),
          padding: EdgeInsets.zero,
          color: AppColors.backgroundColorMode(context),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                value: kDineIn,
                child: ItemTypeBoxPopWidget(
                  title: kDineIn,
                  onTap: () {
                    cubit.changeTicketType(kDineIn);
                    changeSelectedItem(kDineIn);
                  },
                  isSelected: selectedItem == kDineIn ? true : false,
                )),
            PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                value: kTakeOut,
                child: ItemTypeBoxPopWidget(
                  title: kTakeOut,
                  onTap: () {
                    cubit.changeTicketType(kTakeOut);
                    changeSelectedItem(kTakeOut);
                  },
                  isSelected: selectedItem == kTakeOut ? true : false,
                )),
            PopupMenuItem<String>(
                padding: EdgeInsets.zero,
                value: kDelivery,
                child: ItemTypeBoxPopWidget(
                  title: kDelivery,
                  onTap: () {
                    cubit.changeTicketType(kDelivery);
                    changeSelectedItem(kDelivery);
                  },
                  isSelected: selectedItem == kDelivery ? true : false,
                )),
          ],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(context: context,
                  text: cubit.ticketModel.ticketType ??kDineIn,
                ),
                const Icon(Icons.arrow_drop_down_sharp)
              ],
            ),
          ),
        );
      },
    );
  }
}

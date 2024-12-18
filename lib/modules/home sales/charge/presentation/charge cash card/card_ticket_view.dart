import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/charge_ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardTicketView extends StatefulWidget {
  const CardTicketView({super.key, required this.chargePriceTicketModel});
  final ChargePriceTicketPageModel chargePriceTicketModel;

  @override
  State<CardTicketView> createState() => _CardTicketScreen();
}

class _CardTicketScreen extends State<CardTicketView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(context: context,
                      text: "EGP ${widget.chargePriceTicketModel.currentPrice}",
                      size: 30.0,
                    ),
                    CustomText(context: context,
                      text: "total-paid".tr(),
                      type: TextType.description,
                      size: 20,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: "enter_email".tr(),
                        prefixWidget: const Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon:  Icon(
                          Icons.send,
                          color: AppColors.primary(context),
                          size: 25.0,
                        ))
                  ],
                ),
                BlocBuilder<SalesCubit, SalesStates>(
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        if (widget.chargePriceTicketModel.isSplitCycle) {
                          Navigator.of(context).pop(true);
                          
                        } else {
                          SalesCubit.get(context).deleteCurrentTicket();
                          NavigationService.goNamed(AppRouter.layoutRoute);
                        }
                      },
                      text: widget.chargePriceTicketModel.isSplitCycle ? "continue".tr() : "new_sale".tr(),
                      icon: Icons.check,
                      height: 50.0,
                      radius: 0.0,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

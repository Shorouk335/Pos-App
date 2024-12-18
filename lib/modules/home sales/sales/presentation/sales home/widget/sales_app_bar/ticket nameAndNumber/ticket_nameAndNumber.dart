import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketNameAndNumberWidget extends StatelessWidget {
  const TicketNameAndNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return Row(
          children: [
            CustomText(
              context: context,
              text: cubit.ticketModel.name ?? "ticket".tr(),
              color: Colors.white,
              type: TextType.title,
            ),
            const SizedBox(
              width: 10.0,
            ),
            IntrinsicWidth(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: Colors.white,
                        width: 1.0)),
                child: CustomText(
                  context: context,
                  text: cubit.ticketModel.items.length.toString(),
                  color: Colors.white,
                  type: TextType.title,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

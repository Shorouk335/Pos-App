import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCustomerButtonWidget extends StatelessWidget {
  const AddCustomerButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return Visibility(
          visible: cubit.ticketModel.customerName== null,
          replacement: IconButton(
            onPressed: () {
              NavigationService.pushNamed(
                AppRouter.customerDetailsRoute,
               
              );
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          child: IconButton(
            onPressed: () {
              NavigationService.pushNamed(AppRouter.customerRoute ,);
            },
            icon: const Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        );
      },
    );
  }
}

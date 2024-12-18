import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/manager/customer%20cubit/customer_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/manager/customer%20cubit/customer_states.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/add%20edit%20customer/widget/add_customer_box.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditCustomerView extends StatefulWidget {
  const AddEditCustomerView({super.key});

  @override
  State<AddEditCustomerView> createState() => _AddEditCustomerViewState();
}

class _AddEditCustomerViewState extends State<AddEditCustomerView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CustomerCubit(),
      child: BlocConsumer<CustomerCubit, CustomerStates>(
        listener: (context, state) {},
        builder: (context, state) { 
          final cubit = CustomerCubit.get(context);
          return Scaffold(
            appBar: CustomLightAppBar(
              title: "create_customer".tr(),
              actions: [
                 TextButton(
                  onPressed: () { 
                   cubit.addCustomer("Omer");
                    NavigationService.popPage();
                    
                  },
                  child: CustomText(context: context,
                    text: "save".tr(),
                    type: TextType.big,
                  ))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    AddCustomerListTileWidget(
                      title: "name".tr(),
                      icon: Icons.person,
                    ),
                    AddCustomerListTileWidget(
                      title: "email".tr(),
                      icon: Icons.email,
                    ),
                    AddCustomerListTileWidget(
                      title: "phone".tr(),
                      icon: Icons.person,
                    ),
                    AddCustomerListTileWidget(
                      title: "address".tr(),
                      icon: Icons.location_on_rounded,
                    ),
                    AddCustomerListTileWidget(
                      title: "city".tr(),
                    ),
                    AddCustomerListTileWidget(
                      title: "region".tr(),
                    ),
                    AddCustomerListTileWidget(
                      title: "postal_code".tr(),
                    ),
                    AddCustomerListTileWidget(
                      title: "country".tr(),
                    ),
                    AddCustomerListTileWidget(
                      title: "customer_code".tr(),
                      icon: Icons.chrome_reader_mode_outlined,
                    ),
                    AddCustomerListTileWidget(
                      title: "note".tr(),
                      icon: Icons.message,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

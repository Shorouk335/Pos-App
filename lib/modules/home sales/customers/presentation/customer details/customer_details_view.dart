import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/manager/customer%20cubit/customer_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/manager/customer%20cubit/customer_states.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/customer%20details/widget/customer_details_list_tile.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailsView extends StatefulWidget {
  const CustomerDetailsView({
    super.key,
  });

  @override
  State<CustomerDetailsView> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CustomerCubit(),
      child: BlocConsumer<CustomerCubit, CustomerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = CustomerCubit.get(context);
          // TO GET CUSTOMER DATA
          return Scaffold(
            appBar: CustomLightAppBar(
              title: "customer_profile".tr(),
              actions: [
                BlocBuilder<SalesCubit, SalesStates>(
                  builder: (context, state) {
                    final salesCubit = SalesCubit.get(context);
                    return Visibility(
                        visible: salesCubit.ticketModel.customerName == null,
                        replacement: PopupMenuButton<String>(
                          iconColor: AppColors.primary(context),
                          color: AppColors.backgroundColorMode(context),
                          onSelected: (String result) {
                            salesCubit.changeCustomerName(null);

                            NavigationService.popPage();
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'remove_customer',
                              child: CustomText(context: context,
                                text: 'remove_from_ticket'.tr(),
                                color: AppColors.primary(context),
                                size: 18.0,
                              ),
                            ),
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              salesCubit.changeCustomerName("customer");

                              Navigator.of(context).pop(true);
                            },
                            child: CustomText(context: context,
                              text: "add_to_ticket".tr(),
                              type: TextType.big,
                            )));
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Icon(
                        Icons.account_circle,
                        color: AppColors.hintText(context),
                        size: 100.0,
                      ),
                    ),
                     Center(child: CustomText(context: context,text: "ahmed")),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Divider(),
                    CustomerDetailsListTileWidget(
                      icon: Icons.star,
                      title: "0.00",
                      disc: "points".tr(),
                    ),
                    CustomerDetailsListTileWidget(
                      icon: Icons.shopping_bag,
                      title: "0",
                      disc: "visits".tr(),
                    ),
                    CustomerDetailsListTileWidget(
                      icon: Icons.calendar_month,
                      title: "sep 1 2024",
                      disc: "points".tr(),
                    ),
                    TextButton(
                        onPressed: () {
                          NavigationService.pushNamed(
                              AppRouter.addEditCustomerRoute);
                        },
                        child: CustomText(context: context,
                          text: "edit_profile".tr(),
                          type: TextType.big,
                        )),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: CustomText(context: context,
                    //       text: "redeem_points".tr(),
                    //       type: TextType.big,
                    //     )),
                    TextButton(
                        onPressed: () {
                           NavigationService.pushNamed(
                              AppRouter.purchaseHistoryCustomerRoute);
                        },
                        child: CustomText(context: context,
                          text: "view_purchases".tr(),
                          type: TextType.big,
                        ))
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

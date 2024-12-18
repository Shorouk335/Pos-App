import 'dart:developer';

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/manager/customer%20cubit/customer_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/manager/customer%20cubit/customer_states.dart';
import 'package:e_ticket_app/modules/home%20sales/customers/presentation/widget/customer_list_tile_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomersView extends StatefulWidget {
  const CustomersView({super.key});

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
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
      create: (BuildContext context) => CustomerCubit()..getCustomerData(),
      child: BlocConsumer<CustomerCubit, CustomerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = CustomerCubit.get(context);
          return Scaffold(
            appBar: CustomLightAppBar(
              title: "add_customer_to_ticket".tr(),
            ),
            body: Column(
              children: [
                CustomTextFormField(
                  hintText: "search".tr(),
                  prefixWidget: Icon(
                    Icons.search,
                    color: AppColors.normalTextGrey(context),
                    size: 28.0,
                  ),
                  textController: searchController,
                  suffixWidget: IconButton(
                    onPressed: () {
                      searchController.text ="";
                      setState(() {});
                    },
                    icon: Icon(
                      showCloseIcon ? Icons.close : null,
                      color: AppColors.normalTextGrey(context),
                      size: 20.0,
                    ),
                  ),
                  isSearch: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                  onChanged: (s) {},
                ),
                const Divider(),
                const SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: InkWell(
                      onTap: () {
                        NavigationService.pushNamed(
                            AppRouter.addEditCustomerRoute);
                      },
                      child: CustomText(
                        context: context,
                        text: "add_new_customer".tr(),
                        type: TextType.big,
                        size: 24,
                      )),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Divider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 15.0, right: 15.0),
                    child: ListView.separated(
                        separatorBuilder: (context, state) {
                          return const Divider();
                        },
                        itemCount: cubit.customerList.length,
                        itemBuilder: (context, index) {
                          return CustomerListTileWidget(
                              name: cubit.customerList[index]);
                        }),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

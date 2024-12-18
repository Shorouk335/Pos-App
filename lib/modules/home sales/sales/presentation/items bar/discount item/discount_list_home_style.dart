import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/discount%20item/widget/discount_list_home_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// USE IN DISCOUNT IN SALES HOME
class DiscountListHomeStyle extends StatefulWidget {
  const DiscountListHomeStyle({super.key});

  @override
  State<DiscountListHomeStyle> createState() => _DiscountListHomeStyleState();
}

class _DiscountListHomeStyleState extends State<DiscountListHomeStyle> {
  List<DiscountModel> discountList = <DiscountModel>[];

  @override
  void initState() {
    super.initState();
    discountList = HiveService.getDiscountList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(builder: (context, state) {
      final cubit = SalesCubit.get(context);
      return Expanded(
          child: ListView.builder(
              itemCount: discountList.length,
              itemBuilder: (context, index) {
                return DiscountListHomeWidget(
                  discount: discountList[index],
                  onTap: () {
                    cubit.addNewDiscount(discountList[index]);
                  },
                  isIgnoreDiscount:
                      cubit.checkDiscountIsAvailable(discountList[index]),
                );
              }));
    });
  }
}

import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/discount%20item/widget/discount_grid_home_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// USE IN FAVORITE ITEM IN SALES HOME
class DiscountGridHomeStyle extends StatefulWidget {
  const DiscountGridHomeStyle({super.key});

  @override
  State<DiscountGridHomeStyle> createState() => _DiscountGridHomeStyleState();
}

class _DiscountGridHomeStyleState extends State<DiscountGridHomeStyle> {
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
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: discountList.length,
            itemBuilder: (BuildContext context, int index) {
              return DiscountGridHomeWidget(
                discount: discountList[index],
                onTap: () {
                  cubit.addNewDiscount(discountList[index]);
                },
                isIgnoreDiscount:
                    cubit.checkDiscountIsAvailable(discountList[index]),
              );
            }),
      ));
    });
  }
}

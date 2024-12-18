import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/core/discount%20cubit/discount_cubit.dart';
import 'package:e_ticket_app/modules/sales%20items/core/discount%20cubit/discount_states.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/discounts/widget/discount_app_bar_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/discounts/widget/discount_item_list_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/empty_sales_item_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/floating_sales_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/loadingAndError.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscountsView extends StatefulWidget {
  const DiscountsView({super.key});

  @override
  State<DiscountsView> createState() => _DiscountsViewState();
}

class _DiscountsViewState extends State<DiscountsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DiscountCubit()..getDiscountList(),
      child: BlocConsumer<DiscountCubit, DiscountStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = DiscountCubit.get(context);
          return Scaffold(
              appBar: DiscountAppBarWidget(
                typeName: cubit.getNumberOfSelectedDiscount() == 1
                    ? "discount"
                    : "discounts",
                isNormalAppBar: cubit.isSelectedOrNotDiscount(),
                count: cubit.getNumberOfSelectedDiscount(),
                onDeletePressed: cubit.deleteDiscounts,
                onBackPressed: cubit.removeSelectMode,
              ),
              body: LoadingAndError(
                  isLoading: false,
                  isError: state is EmptyDiscountListStates , 
                  errorWidget: const EmptySalesItemWidget(
                    salesItemType: SalesItemType.discounts,
                  ),
                  child: ListView.builder(
                      itemCount: cubit.discountList.length,
                      itemBuilder: (context, index) {
                        return DiscountItemListWidget(
                          item: cubit.discountList[index],
                          refreshTap: (){
                             cubit.getDiscountList(); 
                          },
                          onLongPress: () {
                            cubit.selectDiscountOrNot(cubit.discountList[index]);
                          },
                        );
                      })
                      ),
              floatingActionButton: FloatingItemsAndSettingItemWidget(
                onPressed: () {
                  NavigationService.pushNamed(AppRouter.addEditDiscountsRoute).then((value){
                    if (value == "change"){
                      cubit.getDiscountList(); 
                    }
                  });
                },
              ));
        },
      ),
    );
  }
}

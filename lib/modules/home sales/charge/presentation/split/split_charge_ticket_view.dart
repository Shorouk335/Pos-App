import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/manager/charge_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/presentation/split/widget/split_charge_buttons_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/presentation/split/widget/split_payment_box_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitChargeTicketView extends StatefulWidget {
  const SplitChargeTicketView({super.key, required this.currentPrice});
  final num currentPrice;

  @override
  State<SplitChargeTicketView> createState() =>
      _SplitChargeTicketViewState();
}

class _SplitChargeTicketViewState extends State<SplitChargeTicketView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ChargeCubit()..initialSplitPrice(widget.currentPrice),
      child: BlocConsumer<ChargeCubit, ChargeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ChargeCubit.get(context);
          return Scaffold(
              appBar: CustomDarkAppBar(
                title: "${"remaining".tr()} EGP ${cubit.getCurrentRestPrice()}",
                actions: [
                  IgnorePointer(
                    ignoring: false,
                    child: TextButton(
                        onPressed: () {
                          NavigationService.popPage();
                        },
                        child:
                            CustomText(context: context,text: "done".tr(), color: Colors.white)),
                  )
                ],
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  SplitChargeButtonsWidget(
                    splitNumber: cubit.splitNumber,
                    onIncreaseTap: () {
                      cubit.increaseSplitNumber();
                    },
                    onDecreaseTap: () {
                      cubit.decreaseSplitNumber(
                          cubit.subSplitPriceList.length - 1);
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, left: 15.0, top: 15.0),
                          child: ListView.separated(
                            itemCount: cubit.splitNumber,
                            separatorBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: Divider(),
                              );
                            },
                            itemBuilder: (context, index) {
                              return SplitPaymentBoxWidget(
                                isPaid: cubit.paidSplitPriceList[index],
                                currentWidgetIndex: index,
                                onDeletePressed: () {
                                  if (cubit.splitNumber > 1) {
                                    cubit.decreaseSplitNumber(index);
                                  }
                                },
                                splitPrice: num.parse(
                                  cubit.subSplitPriceList[index],
                                ),
                              );
                            },
                          )))
                ],
              ));
        },
      ),
    );
  }
}

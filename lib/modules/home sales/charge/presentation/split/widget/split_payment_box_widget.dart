import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/constant/drop_down_item.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/charge/manager/charge_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/charge_ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_drop_down.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitPaymentBoxWidget extends StatefulWidget {
  const SplitPaymentBoxWidget(
      {super.key,
      required this.splitPrice,
      required this.onDeletePressed,
      required this.isPaid,
      required this.currentWidgetIndex});
  final num splitPrice;
  final void Function()? onDeletePressed;
  final bool isPaid;
  final int currentWidgetIndex;

  @override
  State<SplitPaymentBoxWidget> createState() => _SplitPaymentBoxWidgetState();
}

class _SplitPaymentBoxWidgetState extends State<SplitPaymentBoxWidget> {
  int paymentDropDownValue = 0;
  bool isDisableChargeButton = false;
  TextEditingController splitPriceController = TextEditingController();
  late bool isPaidPrice;
  late int currentIndex;

  @override
  void initState() {
    splitPriceController = TextEditingController(text: "${widget.splitPrice}");
    isPaidPrice = widget.isPaid;
    currentIndex = widget.currentWidgetIndex;
    splitPriceController.addListener(() {
      checkAvailableChargeButton();
    });
    super.initState();
  }

  void checkAvailableChargeButton() {
    if (splitPriceController.text.isEmpty ||
        num.tryParse(splitPriceController.text) == 0) {
      isDisableChargeButton = true;
    } else {
      isDisableChargeButton = false;
    }

    setState(() {});
  }

  @override
  void didUpdateWidget(covariant SplitPaymentBoxWidget oldWidget) {
    if (oldWidget.isPaid != widget.isPaid) {
      isPaidPrice = widget.isPaid;
    }
    if (oldWidget.currentWidgetIndex != widget.currentWidgetIndex) {
      currentIndex = widget.currentWidgetIndex;
    }
    if (oldWidget.splitPrice != widget.splitPrice) {
      isDisableChargeButton = false;
      splitPriceController =
          TextEditingController(text: "${widget.splitPrice}");
      splitPriceController.addListener(() {
        checkAvailableChargeButton();
      });
    }
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    splitPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChargeCubit, ChargeState>(
      builder: (context, state) {
        final cubit = ChargeCubit.get(context);
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: widget.onDeletePressed,
                  icon:  Icon(
                    Icons.delete,
                    size: 30,
                    color: AppColors.normalTextGrey(context),
                  )),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: IgnorePointer(
                  ignoring: isPaidPrice,
                  child: Column(
                    children: [
                      CustomDropDown(
                        hint: "Cash",
                        isIgnore: isPaidPrice,
                        onChanged: (value) {
                          setState(() {
                            paymentDropDownValue = value ?? 0;
                          });
                        },
                        value: 0,
                        items: DropDownItem.paymentItem(context,isIgnore: isPaidPrice ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextFormField(
                        keybordType: TextInputType.number,
                        textController: splitPriceController,
                        aroundPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        borderSideColor:
                            isPaidPrice ? AppColors.greyBorder : null,
                        textStyle: TextStyle(
                            color: isPaidPrice
                                ? AppColors.greyBorder
                                : AppColors.normalTextGrey(context),
                            fontSize: 18.0),
                        onChanged: (s) {
                          // if (splitPriceController.text != "") {

                          //   if (num.tryParse(splitPriceController.text)! >
                          //       num.parse(cubit.getCurrentRestPrice())) {
                          //     splitPriceController.text =
                          //         cubit.getCurrentRestPrice();
                          //     cubit.changeValueOfSplitPrice(
                          //         currentIndex, cubit.getCurrentRestPrice());
                          //   } else {
                          //     cubit.changeValueOfSplitPrice(
                          //         currentIndex,splitPriceController.text);
                          //   }
                          // } else {
                          //   cubit.changeValueOfSplitPrice(
                          //         currentIndex,"00");

                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Visibility(
                visible: !isPaidPrice,
                replacement: Row(
                  children: [
                     Icon(
                      Icons.check,
                      color: AppColors.primary(context),
                    ),
                    CustomText(context: context,
                      text: "paid".tr(),
                      color: AppColors.primary(context),
                    ),
                  ],
                ),
                child: IgnorePointer(
                  ignoring: isDisableChargeButton,
                  child: CustomButton(
                    onPressed: () {
                      if (paymentDropDownValue == 0) {
                        NavigationService.pushNamed(
                          AppRouter.chargeTicketRoute,
                          extra: ChargePriceTicketPageModel(
                              currentPrice:
                                  num.parse(splitPriceController.text),
                              isSplitCycle: true),
                        ).then((value) {
                          if (value == true) {
                            cubit.addPaidPrice(
                                splitPriceController.text, currentIndex);
                          }
                        });
                      } else {
                        NavigationService.pushNamed(AppRouter.cardTicketRoute,
                                extra: ChargePriceTicketPageModel(
                                    currentPrice:
                                        num.parse(splitPriceController.text),
                                    isSplitCycle: true))
                            .then((value) {
                          if (value == true) {
                            cubit.addPaidPrice(
                                splitPriceController.text, currentIndex);
                          }
                        });
                      }
                    },
                    text: "charge".tr(),
                    textSize: 20.0,
                    textColor: Colors.white,
                    height: 40.0,
                    radius: 0.0,
                    backgroundColor:
                        isDisableChargeButton ? Colors.grey.shade300 : null,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

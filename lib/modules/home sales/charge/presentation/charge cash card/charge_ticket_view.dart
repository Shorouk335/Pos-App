
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/charge_ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChargeTicketView extends StatefulWidget {
  const ChargeTicketView({super.key, required this.chargeTicketModel});
  final ChargePriceTicketPageModel chargeTicketModel;

  @override
  State<ChargeTicketView> createState() => _ChargeTicketViewState();
}

class _ChargeTicketViewState extends State<ChargeTicketView> {
  TextEditingController priceCashController = TextEditingController();
  bool isDisableCashButton = false;

  @override
  void dispose() {
    priceCashController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    priceCashController =
        TextEditingController(text: "${widget.chargeTicketModel.currentPrice}");
    priceCashController.addListener(() {
      checkAvailableCash();
    });
    super.initState();
  }

  void checkAvailableCash() {
    num newPrice = num.tryParse(priceCashController.text) ?? 0.0;
    if (newPrice < widget.chargeTicketModel.currentPrice || newPrice == 0.0) {
      isDisableCashButton = true;
    } else {
      isDisableCashButton = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(
        actions: [
          if (!widget.chargeTicketModel.isSplitCycle)
            TextButton(
                onPressed: () {
                  NavigationService.pushNamed(AppRouter.splitChargeTicketRoute,
                      extra: widget.chargeTicketModel.currentPrice);
                },
                child: CustomText(context: context,
                  text: "split".tr(),
                 type: TextType.textButton,
                ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CustomText(context: context,
                      text:
                          "EGP ${widget.chargeTicketModel.currentPrice.toString()}",
                      size: 35.0,
                    ),
                    CustomText(context: context,
                      text: "total_amount_due".tr(),
                      type: TextType.description,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              CustomText(context: context,
                text: "cash_received".tr(),
                type: TextType.big,
                
              ),
              CustomTextFormField(
                keybordType: TextInputType.number,
                textController: priceCashController,
              ),
              const SizedBox(
                height: 50.0,
              ),
              IgnorePointer(
                ignoring: isDisableCashButton,
                child: CustomOutlineButton(
                  onPressed: () {
                    if (widget.chargeTicketModel.isSplitCycle) {
                      NavigationService.pushNamed(AppRouter.cashTicketRoute,
                          extra: ChargePriceTicketPageModel(
                              currentPrice:
                                  num.tryParse(priceCashController.text) ?? 0.0,
                              isSplitCycle:
                                  widget.chargeTicketModel.isSplitCycle));
                    } else {
                      NavigationService.pushReplacement(
                          AppRouter.cashTicketRoute,
                          extra: ChargePriceTicketPageModel(
                              currentPrice:
                                  num.tryParse(priceCashController.text) ?? 0.0,
                              isSplitCycle:
                                  widget.chargeTicketModel.isSplitCycle));
                    }
                  },
                  text: "cash".tr(),
                  icon: Icons.payments_outlined,
                   backgroundColor: AppColors.buttonBackGroundLight(context),
                  textColor: isDisableCashButton
                      ? Colors.grey.shade400
                      : AppColors.textNormalColor(context),
                  iconColor: isDisableCashButton
                      ? Colors.grey.shade400
                      : AppColors.normalTextGrey(context),
                  height: 50.0,
                  radiusColor: Colors.grey.shade200,
                  radius: 0.0,
                ),
              ),
              if (!widget.chargeTicketModel.isSplitCycle)
                const SizedBox(
                  height: 50.0,
                ),
              if (!widget.chargeTicketModel.isSplitCycle)
                CustomOutlineButton(
                  onPressed: () {
                    NavigationService.pushReplacement(AppRouter.cardTicketRoute,
                        extra: ChargePriceTicketPageModel(
                            currentPrice: widget.chargeTicketModel.currentPrice,
                            isSplitCycle:
                                widget.chargeTicketModel.isSplitCycle));
                  },
                  text: "card".tr(),
                  icon: Icons.payment_outlined,
                  backgroundColor: AppColors.buttonBackGroundLight(context),
                  textColor: AppColors.textNormalColor(context),
                  iconColor: AppColors.normalTextGrey(context),
                  height: 50.0,
                  radiusColor: Colors.grey.shade200,
                  radius: 0.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

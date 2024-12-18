import 'package:e_ticket_app/core/app_utils/utils.dart';
import 'package:e_ticket_app/modules/shift/presentation/cash%20managment/widget/pay_in_out_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

class CashManagementView extends StatefulWidget {
  const CashManagementView({super.key});

  @override
  State<CashManagementView> createState() => _CashManagementViewState();
}

class PayModel {
  String amount;
  String id;
  PayModel(this.id, this.amount);
}

class _CashManagementViewState extends State<CashManagementView> {
  TextEditingController amount = TextEditingController();
  bool isIgnoreBottom = true;
  List<PayModel> payItems = [];
  @override
  initState() {
    super.initState();
    amount.addListener(() {
      if (amount.text == "") {
        isIgnoreBottom = true;
      } else {
        isIgnoreBottom = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDarkAppBar(
        title: "cash_management".tr(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                CustomTextFormField(
                  borderSideColor: Colors.grey,
                  labelText: "amount".tr(),
                  labelStyle: const TextStyle(color: Colors.grey),
                  textController: amount,
                  onChanged: (s) {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                CustomTextFormField(
                  labelStyle: const TextStyle(color: Colors.grey),
                  labelText: "comment".tr(),
                  borderSideColor: Colors.grey,
                  onChanged: (s) {},
                ),
                const SizedBox(
                  height: 15.0,
                ),
                IgnorePointer(
                  ignoring: isIgnoreBottom,
                  child: CustomOutlineButton(
                    radius: 0.0,
                    radiusColor: isIgnoreBottom ? Colors.grey : null,
                    onPressed: () {
                      payItems.insert(0, PayModel(Utils.getId(), amount.text));

                      setState(() {});
                    },
                    text: "pay_in".tr(),
                    textSize: 20,
                    textColor: isIgnoreBottom ? Colors.grey : null,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                IgnorePointer(
                  ignoring: isIgnoreBottom,
                  child: CustomOutlineButton(
                    radius: 0.0,
                    radiusColor: isIgnoreBottom ? Colors.grey : Colors.red,
                    onPressed: () {
                        payItems.insert(0, PayModel(Utils.getId(), amount.text));
                      setState(() {});
                    },
                    text: "pay_out".tr(),
                    textSize: 20,
                    textColor: isIgnoreBottom ? Colors.grey : Colors.red,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          Visibility(
            visible: payItems.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomText(context: context,
                    text: "pay_in/pay_out".tr(),
                    type: TextType.big,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ImplicitlyAnimatedReorderableList<PayModel>(
              items: payItems,
              areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
              onReorderFinished: (item, from, to, newItems) {
                setState(() {
                  payItems
                    ..clear()
                    ..addAll(newItems);
                });
              },
              itemBuilder: (context, itemAnimation, item, index) {
                return Reorderable(
                  key: ValueKey(item.id),
                  builder: (context, dragAnimation, inDrag) {
                    return SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: itemAnimation,
                        child: PayInOutItemWidget(
                          payModel: item,
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

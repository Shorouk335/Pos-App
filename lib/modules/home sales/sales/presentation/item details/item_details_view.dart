import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/item%20details/widget/calculate_button.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart' as l;
import 'package:flutter/material.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  late ItemModel currentItemModel;
  String total = "";
  List<String> calculateButtonTextList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    ".",
    "ok"
  ];

  changePrice(String number) {
    setState(() {
      if (total.length > 8) {
        total = "999999.99";
      } else {
        total = total + number;
      }
    });
  }

  @override
  void initState() {
    currentItemModel = widget.itemModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomLightAppBar(
            title: currentItemModel.name,
          ),
          body: Column(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(context: context,
                                    text: "price".tr(),
                                    type: TextType.title,
                                    size: 30,
                                  ),
                                  CustomText(context: context,
                                    text: 'EGP ${total == "" ? "0.00" : total}',
                                    type: TextType.big,
                                    size: 35,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            Expanded(child: CalculateClearButtonWidget(
                              onTap: () {
                                setState(() {
                                  if (total != "") {
                                    total =
                                        total.substring(0, total.length - 1);
                                  }
                                });
                              },
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        GridView.builder(
                            itemCount: 12,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 15.0,
                              childAspectRatio: 1,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CalculateButtonWidget(
                                text: calculateButtonTextList[index],
                                isOkButton: index == 11 ? true : false,
                                onTap: () {
                                  if (index == 11) {
                                    if (total != "") {
                                      currentItemModel.salary =
                                          num.parse(total);

                                      Navigator.of(context)
                                          .pop(currentItemModel);
                                    } else {
                                      NavigationService.popPage();
                                    }
                                  } else {
                                    changePrice(calculateButtonTextList[index]);
                                  }
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

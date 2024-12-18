import 'dart:developer';

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/widget/edit%20item%20widget/edit_salary_item_button.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/ticket%20details/widget/edit%20item%20widget/item_info_widget.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditItemTicketView extends StatefulWidget {
  const EditItemTicketView({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  State<EditItemTicketView> createState() => _EditItemTicketViewState();
}

class _EditItemTicketViewState extends State<EditItemTicketView> {
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    numberController.text = widget.itemModel.count.toString();
    super.initState();
  }

  changeTotalSalary() {
    num salary = widget.itemModel.salary ?? 0.0;
    num count = widget.itemModel.count ?? 0.0;
    widget.itemModel.total = count * salary;
    log(widget.itemModel.total.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomLightAppBar(
          title:
              "${widget.itemModel.name} ${widget.itemModel.total.toString()} EGP",
          actions: widget.itemModel.isSaved != true
              ? [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(widget.itemModel);
                      },
                      child: CustomText(context: context,
                          text: "save".tr(),
                          type: TextType.big,
                          color: AppColors.primary(context))),
                ]
              : [const SizedBox()],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Visibility(
            visible: widget.itemModel.isSaved == true,
            replacement: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(context: context,
                    text: "price".tr(),
                    type: TextType.big,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                      onTap: () {
                        NavigationService.pushNamed(AppRouter.itemDetailsRoute,
                                extra: widget.itemModel)
                            .then((value) {
                          changeTotalSalary();
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(context: context,
                            text: widget.itemModel.salary.toString(),
                          ),
                          const Divider(),
                        ],
                      )),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomText(context: context,
                    text: "quantity".tr(),
                    type: TextType.big,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  EditItemSalaryButtonWidget(
                    count: numberController,
                    onChanged: (s) {
                      if (s != "") {
                        widget.itemModel.count = int.tryParse(s);
                        numberController.text = s;
                      } else {
                        widget.itemModel.count = 0;
                        numberController.text = "";
                      }
                      changeTotalSalary();
                    },
                    onDecreaseTap: () {
                      if (widget.itemModel.count != 0) {
                        widget.itemModel.count = widget.itemModel.count! - 1;
                        numberController.text =
                            widget.itemModel.count.toString();
                        changeTotalSalary();
                      }
                    },
                    onIncreaseTap: () {
                      widget.itemModel.count = widget.itemModel.count! + 1;
                      numberController.text = widget.itemModel.count.toString();
                      changeTotalSalary();
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomText(context: context,
                    text: "comment".tr(),
                    type: TextType.big,
                  ),
                  CustomTextFormField(
                    hintText: "enter_comment".tr(),
                    contentPadding: EdgeInsets.zero,
                  )
                ],
              ),
            ),
            child: ItemInfoWidget(
              itemModel: widget.itemModel,
            ),
          ),
        ));
  }
}

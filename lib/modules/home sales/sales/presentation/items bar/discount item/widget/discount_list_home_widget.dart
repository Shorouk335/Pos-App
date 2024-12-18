import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class DiscountListHomeWidget extends StatefulWidget {
  const DiscountListHomeWidget(
      {super.key,
      required this.discount,
      required this.onTap,
      this.isIgnoreDiscount = false});
  final DiscountModel discount;
  final void Function()? onTap;
  final bool isIgnoreDiscount;
  @override
  State<DiscountListHomeWidget> createState() => _DiscountItemListWidgetState();
}

class _DiscountItemListWidgetState extends State<DiscountListHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isIgnoreDiscount,
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          children: [
            const SizedBox(
              width: 12.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.2),
              radius: 25,
              child: Icon(
                Icons.discount_outlined,
                size: 25,
                color: AppColors.normalTextGrey(context),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: IntrinsicWidth(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          CustomText(
                            context: context,
                            text: widget.discount.name ?? "",
                            color: widget.isIgnoreDiscount
                                ? AppColors.hintText(context)
                                : null,
                          ),
                          const Spacer(),
                          CustomText(
                            context: context,
                            color: widget.isIgnoreDiscount
                                ? AppColors.hintText(context)
                                : null,
                            text: widget.discount.isPercentage == true
                                ? "${widget.discount.value} %"
                                : widget.discount.value.toString(),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

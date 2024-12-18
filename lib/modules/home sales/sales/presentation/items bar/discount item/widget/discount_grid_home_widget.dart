import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class DiscountGridHomeWidget extends StatefulWidget {
  const DiscountGridHomeWidget(
      {super.key,
      required this.discount,
      required this.onTap,
      this.isIgnoreDiscount = false});
  final DiscountModel discount;
  final void Function()? onTap;
  final bool isIgnoreDiscount;

  @override
  State<DiscountGridHomeWidget> createState() => _DiscountGridHomeWidgetState();
}

class _DiscountGridHomeWidgetState extends State<DiscountGridHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isIgnoreDiscount,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.discount_outlined,
                size: 30,
                color: AppColors.normalTextGrey(context),
              ),
              CustomText(
                context: context,
                text: widget.discount.name ?? "",
                color: widget.isIgnoreDiscount
                    ? AppColors.hintText(context)
                    : null,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText(
                context: context,
                color: widget.isIgnoreDiscount
                    ? AppColors.hintText(context)
                    : null,
                text: widget.discount.isPercentage == true
                    ? "${widget.discount.value} %"
                    : widget.discount.value.toString(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/svgIcon.dart';
import 'package:flutter/material.dart';

class BoxDiscountAmountTypeWidget extends StatefulWidget {
  const BoxDiscountAmountTypeWidget({super.key , required this.isValueSelected , required this.onTap});
  final bool isValueSelected ; 
  final void Function()? onTap ; 
 

  @override
  State<BoxDiscountAmountTypeWidget> createState() =>
      _BoxDiscountAmountTypeWidgetState();
}

class _BoxDiscountAmountTypeWidgetState
    extends State<BoxDiscountAmountTypeWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey, width: 2.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: widget.onTap,
              splashColor: Colors.transparent,
              child: Container(
                  width: 50,
                  height: 50,
                  color: widget.isValueSelected
                      ? null
                      : AppColors.onPrimary(context).withOpacity(0.2),
                  child:  Icon(
                    Icons.percent,
                    color: AppColors.normalTextGrey(context),
                    size: 25.0,
                  )),
            ),
          ),
          const VerticalDivider(
            width: 1,
            color: Colors.grey,
            thickness: 1.0,
          ),
          Expanded(
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                  width: 50,
                  height: 50,
                  color: widget.isValueSelected
                      ? AppColors.onPrimary(context).withOpacity(0.2)
                      : null,
                  child:  Center(
                      child: SvgIconWidget(
                    svg: "sigma",
                    color: AppColors.normalTextGrey(context),
                    size: 20.0,
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}

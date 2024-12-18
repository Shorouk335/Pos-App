import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/auth/presentation/forget_password/change_password_View.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RefundReceiptItemWidget extends StatefulWidget {
  const RefundReceiptItemWidget({super.key, required this.item});
  final ItemModel? item;

  @override
  State<RefundReceiptItemWidget> createState() =>
      _RefundReceiptItemWidgetState();
}

class _RefundReceiptItemWidgetState extends State<RefundReceiptItemWidget> {
  bool? isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: InkWell(
        splashColor: Colors.transparent,
        onTap: () {},
        child: SizedBox(
          width: 20,
          child: Checkbox(
            onChanged: (s) {
              isCheckBox = s;
              setState(() {});
            },
            activeColor: AppColors.primary(context),
            value: isCheckBox,
          ),
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Row( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(context: context,
                text: widget.item!.name ?? "",
                
              ),
               CustomText(context: context,
                text: " x ",
               
              ),
              CustomText(context: context,
                text: widget.item!.count.toString() ?? "",
               
              ),
            ],
          ) , 
          const SizedBox(height: 5.0,) , 
          Row(
            children: [
              CustomText(context: context,
                text: "refund".tr(),
                type: TextType.description,
                color: Colors.orange,
              ),
               CustomText(context: context,
                text: " x ",
                type: TextType.description,
                color: Colors.orange,
              ),
              CustomText(context: context,
                text: widget.item!.count.toString() ?? "",
                type: TextType.description,
                color: Colors.orange,
              ),
            ],
          )
        ],
      ),
      contentPadding: EdgeInsets.zero,
      trailing: CustomText(context: context,
        text: " EGP ${widget.item!.total.toString() ?? ""}",
       
      ),
    );
  }
}

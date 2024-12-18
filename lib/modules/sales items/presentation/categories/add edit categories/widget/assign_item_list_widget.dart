import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/service/item_shape_service.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class AssignItemListWidget extends StatefulWidget {
  const AssignItemListWidget(
      {super.key, required this.item , required this.onTap , required this.onChanged});
  final ItemModel item;
  final void Function()? onTap ; 
  final void Function(bool?)? onChanged ;

  @override
  State<AssignItemListWidget> createState() => _AssignItemListWidgetState();
}

class _AssignItemListWidgetState extends State<AssignItemListWidget> {  


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap , 
        splashColor: Colors.transparent,
        child: Row(
          children: [
               SizedBox(
                width: widget.item.shape != "sun"  ? 12.0 :10.0,
              ),
             ItemShapeService.getCurrentItemShape(widget.item.color ?? 0, widget.item.shape ?? "" , false) , 
            
              SizedBox(
                width: widget.item.shape != "sun"  ? 12.0 :10.0,
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
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(context: context,text: widget.item.name ?? ""),
                             CustomText(context: context,
                              text: "category 1",
                              type: TextType.description,
                            ),
                          ],
                        ),
                        trailing:  Row( 
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 20,
                              child: Checkbox(
                                 onChanged:widget.onChanged , 
                                activeColor: AppColors.primary(context),
                                checkColor: Colors.white,
                                value: widget.item.isSelected,
                              ),
                            ),
                         
              const SizedBox(
                width: 12.0,
              ),
                          ],
                        ),
              ),
            ),), 
            ) , ) , ]
           
        ));
  }
}

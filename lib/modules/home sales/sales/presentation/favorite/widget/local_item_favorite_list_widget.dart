import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/svgIcon.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';

class LocalItemFavoriteListWidget extends StatelessWidget {
  const LocalItemFavoriteListWidget({super.key, required this.item , required this.onTap});
  final ItemModel item; 
  final void Function()? onTap ; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ 
         SizedBox(width: 10.0,) ,
        Stack( 
          alignment: AlignmentDirectional.topStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0 , left: 5.0 , right: 5.0),
              child: SvgIconWidget(
                svg: "circle_fill",
                color: Colors.red, 
                size: 45,
              ),
            ), 
            InkWell(
                onTap: onTap ,
              child: CircleAvatar(  
                radius: 12.0,
                backgroundColor: AppColors.backgroundGray(context),
                child: Icon(Icons.close , size: 15, color: AppColors.textNormalColor(context),),
              ),
            )
          ],
        ), 
        SizedBox(width: 5.0,) ,
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
                    leading:
                        CustomText(context: context, text: item.name ?? ""),
                    trailing: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row( 
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(context: context, text: "category1"),
                            SizedBox(
                              width: 15.0,
                            ),
                            const Handle(
                              delay: Duration(milliseconds: 0),
                              capturePointer: true,
                              child: Icon(
                                Icons.drag_handle,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

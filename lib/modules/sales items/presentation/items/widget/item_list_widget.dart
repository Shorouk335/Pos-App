import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/core/service/item_shape_service.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget(
      {super.key, required this.item, required this.onLongPress });
  final ItemModel item;
  final void Function() onLongPress;

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {  
    @override
  void didUpdateWidget(covariant ItemListWidget oldWidget) {
    if (oldWidget.item != widget.item) {
    
    }
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
        // edit & delete 
        // onTap: widget.item.isSelected == true
        //     ? widget.onLongPress
        //     : () {
        //         NavigationService.pushNamed(AppRouter.addEditItemsRoute,
        //             extra: widget.item);
        //       },
        // onLongPress: widget.onLongPress , 
        splashColor: Colors.transparent,
        child: Container( 
          color:widget.item.isSelected == true ? AppColors.onPrimary(context).withOpacity(0.4) : null ,
          child: Row(
            children: [
                 SizedBox(
                  width:widget.item.shape != "sun"  ? 10.0 : 8.0,
                ),
                Visibility( 
                  visible: widget.item.isSelected == true , 
                  replacement:ItemShapeService.getCurrentItemShape(widget.item.color ?? 0, widget.item.shape ?? "" , false) ,
                  child:  CircleAvatar(
                    backgroundColor: AppColors.primary(context),
                    radius: 20,
                    child: Icon(Icons.check , color: Colors.white, size: 25.0,),
                  )  ,
                  
                  ) ,
                   SizedBox(
                  width:widget.item.shape != "sun"  ? 10.0 : 8.0,
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
                          trailing: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: CustomText(context: context,text: "variable".tr())),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}

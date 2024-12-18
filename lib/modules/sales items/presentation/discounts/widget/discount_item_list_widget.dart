import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class DiscountItemListWidget extends StatefulWidget {
  const DiscountItemListWidget({super.key, required this.item , required this.onLongPress , required this.refreshTap});
  final DiscountModel item;
  final void Function() onLongPress;
  final void Function() refreshTap ; 

  @override
  State<DiscountItemListWidget> createState() => _DiscountItemListWidgetState();
}

class _DiscountItemListWidgetState extends State<DiscountItemListWidget> {
      @override
  void didUpdateWidget(covariant DiscountItemListWidget oldWidget) {
    if (oldWidget.item != widget.item) {
    
    }
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.item.isSelected == true
            ? widget.onLongPress
            : () {
          NavigationService.pushNamed(AppRouter.addEditDiscountsRoute ,extra: widget.item).then(
            (value){
              if(value == "change"){
                   widget.refreshTap.call() ; 
              }
            });
        },
        onLongPress: widget.onLongPress,
        splashColor: Colors.transparent,
        child: Container(
                    color:widget.item.isSelected == true ? AppColors.onPrimary(context).withOpacity(0.4) : null ,

          child: Row(
            children: [
              const SizedBox(
                width: 12.0,
              ),
               Visibility( 
                  visible: widget.item.isSelected == true , 
                  replacement: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.2),
                radius: 25,
                child:  Icon(
                  Icons.discount_outlined,
                  size: 25,
                  color: AppColors.normalTextGrey(context),
                ),
              ),
                  child:  CircleAvatar(
                    backgroundColor: AppColors.primary(context),
                    radius: 20,
                    child: Icon(Icons.check , color: Colors.white, size: 25.0,),
                  )  ,
                  
                  ) ,
              
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
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                         
                          children: [
                            CustomText(context: context,text: widget.item.name ??"" ),
                            const Spacer(), 
                             CustomText(context: context,
                              text: widget.item.isPercentage == true ? "${widget.item.value} %" :widget.item.value.toString()  ,
                            
                            ),
                            const SizedBox(width: 5.0,) , 
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}

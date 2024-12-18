import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/category_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/svgIcon.dart';
import 'package:flutter/material.dart';

class CategoryItemListWidget extends StatefulWidget {
  const CategoryItemListWidget({super.key, required this.category , required this.onLongPress});
  final CategoryModel category;
  final void Function() onLongPress;

  @override
  State<CategoryItemListWidget> createState() => _CategoryItemListWidgetState();
}

class _CategoryItemListWidgetState extends State<CategoryItemListWidget> {
       @override
  void didUpdateWidget(covariant CategoryItemListWidget oldWidget) {
    if (oldWidget.category != widget.category) {
    
    }
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }
 
  @override
  Widget build(BuildContext context) {
    return InkWell( 
        // edit & delete
        // onTap: widget.category.isSelected == true
        //     ? widget.onLongPress
        //     : () {
        //   NavigationService.pushNamed(AppRouter.addEditCategoriesRoute , extra:widget.category.name  );
        // },
        // onLongPress: widget.onLongPress ,
        splashColor: Colors.transparent,
        child: Container(
           color:widget.category.isSelected == true ? AppColors.onPrimary(context).withOpacity(0.4) : null ,
          child: Row(
            children: [
              const SizedBox(
                width: 12.0,
              ),
                Visibility( 
                  visible: widget.category.isSelected == true , 
                  replacement: SvgIconWidget(svg: "circle_fill" , size: 45, color: Colors.red,)  ,
                  child:  CircleAvatar(
                    backgroundColor: AppColors.primary(context),
                    radius: 20,
                    child: Icon(Icons.check , color: Colors.white, size: 25.0,),
                  )  ,
                  
                  ) , 

              const SizedBox(
                width: 10.0,
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(context: context,text: widget.category.name ?? "" ),
                               CustomText(context: context,
                                text: "category 1",
                                type: TextType.description,
                              ),
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

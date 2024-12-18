import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/setting/domain/model/setting_item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class SettingItemListWidget extends StatefulWidget {
  const SettingItemListWidget(
      {super.key, required this.settingItemModel,  this.onLongPress ,required this.iconData ,   this.nextRoute});
  final SettingItemModel settingItemModel;
  final void Function()? onLongPress;
  final String? nextRoute ; 
  final IconData iconData ; 

  @override
  State<SettingItemListWidget> createState() =>
      _SettingItemListWidgetState();
}

class _SettingItemListWidgetState extends State<SettingItemListWidget> {
  @override
  void didUpdateWidget(covariant SettingItemListWidget oldWidget) {
    if (oldWidget.settingItemModel != widget.settingItemModel) {}
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.settingItemModel.isSelected == true
            ? widget.onLongPress
            :  widget.nextRoute != null ? 
            (){
                NavigationService.pushNamed(widget.nextRoute!,
                    extra: widget.settingItemModel);
              }
               : null ,
        splashColor: Colors.transparent,
         onLongPress: widget.onLongPress , 
        child: Container(
          color: widget.settingItemModel.isSelected == true
              ? AppColors.onPrimary(context).withOpacity(0.4)
              : null,
          child: Row(
            children: [
              const SizedBox(
                width: 12.0,
              ),
              Visibility(
                visible: widget.settingItemModel.isSelected == true,
                replacement: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  radius: 25,
                  child:  Icon(
                    widget.iconData , 
                    size: 25,
                    color: AppColors.normalTextGrey(context),
                  ),
                ),
                child:  CircleAvatar(
                  backgroundColor: AppColors.primary(context),
                  radius: 20,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 25.0,
                  ),
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
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ListTile(
                          leading:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(context: context,text: widget.settingItemModel.name ?? ""),
                             CustomText(context: context,
                              text: "disc",
                              type: TextType.description,
                            ),
                          ],
                        ),  

                        trailing: CustomText(context: context,text: "text" , type: TextType.description,) ,
                      
                      ), 
                      ),
                  ) ,
                ),
              ),
            ],
          ),
        ));
  }
}

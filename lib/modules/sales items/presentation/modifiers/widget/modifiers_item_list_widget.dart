import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/modifier_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class ModifiersItemListWidget extends StatefulWidget {
  const ModifiersItemListWidget(
      {super.key, required this.modifier, required this.onLongPress});
  final ModifierModel modifier;
  final void Function() onLongPress;

  @override
  State<ModifiersItemListWidget> createState() =>
      _ModifiersItemListWidgetState();
}

class _ModifiersItemListWidgetState extends State<ModifiersItemListWidget> {
  @override
  void didUpdateWidget(covariant ModifiersItemListWidget oldWidget) {
    if (oldWidget.modifier != widget.modifier) {}
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.modifier.isSelected == true
            ? widget.onLongPress
            : () {
                NavigationService.pushNamed(AppRouter.addEditModifiersRoute,
                    extra: widget.modifier.name);
              },
        splashColor: Colors.transparent,
         onLongPress: widget.onLongPress , 
        child: Container(
          color: widget.modifier.isSelected == true
              ? AppColors.onPrimary(context).withOpacity(0.4)
              : null,
          child: Row(
            children: [
              const SizedBox(
                width: 12.0,
              ),
              Visibility(
                visible: widget.modifier.isSelected == true,
                replacement: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  radius: 25,
                  child:  Icon(
                    Icons.task_outlined,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(context: context,text: widget.modifier.name ?? ""),
                             CustomText(context: context,
                              text: "mmmm 1",

                              /// all options name in modifier
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

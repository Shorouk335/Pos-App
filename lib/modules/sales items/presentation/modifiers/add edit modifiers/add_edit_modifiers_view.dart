import 'package:e_ticket_app/core/app_utils/validation.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/modifiers/add%20edit%20modifiers/widget/box_add_option_widget.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/widget/add%20sales%20item/cancel_changed_add_sales_item_dialog.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

class AddEditModifiersView extends StatefulWidget {
  const AddEditModifiersView({super.key, this.modifier});
  final String? modifier;

  @override
  State<AddEditModifiersView> createState() => _AddEditModifiersViewState();
}

class _AddEditModifiersViewState extends State<AddEditModifiersView>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
// when create model make uuid for key in recodable
  List<String> optionList = ["option1", "dd", "kk", "dnn"];

  void onReorderFinished(List<String> newOption) {
    scrollController.jumpTo(scrollController.offset);
    setState(() {
      optionList
        ..clear()
        ..addAll(newOption);
    });
  }

  void deleteOption(int index) {
    setState(() {
      optionList.removeAt(index);
    });
  }

  void addOption() {
    setState(() {
      optionList.add("option${optionList.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGray(context),
      appBar: CustomDarkAppBar(
        onBackPressed: widget.modifier == null
            ? () {
                // if user add value in screen only
                showCancelChangedAddSalesItemDialog(context);
              }
            : null,
        title: widget.modifier == null
            ? "create_modifier".tr()
            : "edit_modifier".tr(),
        actions: [
          TextButton(
              onPressed: () {},
              child: CustomText(
                context: context,
                text: "save".tr(),
                type: TextType.textButton,
              ))
        ],
      ),
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          Container(
            color: AppColors.backgroundColorMode(context),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    initialValue: widget.modifier ?? "",
                    labelText: "modifier_name".tr(),
                    contentPadding: EdgeInsets.zero,
                    validator: CustomValidation.normalValidation,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _buildAddOptionList(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: addOption,
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: AppColors.primary(context),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        CustomText(
                          context: context,
                          text: "add_option".tr(),
                          type: TextType.big,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
           if (widget.modifier != null)
              SizedBox(
              height: 20.0,
            ),
          
          if (widget.modifier != null)
            Container(
              color: AppColors.backgroundColorMode(context),
              child: CustomButton(
                  backgroundColor: AppColors.backgroundColorMode(context),
                  radius: 0.0,
                  textColor: AppColors.textNormalColor(context),
                  icon: Icons.delete,
                  iconColor: AppColors.normalTextGrey(context),
                  onPressed: () {},
                  text: "delete_modifier".tr()),
            ),
             if (widget.modifier != null)
              SizedBox(
              height: 20.0,
            ),
        ],
      ),
    );
  }

  Widget _buildAddOptionList() {
    Reorderable buildReorderable(
        String option, Animation<double> itemAnimation, int index) {
      return Reorderable(
        key: ValueKey(option),
        builder: (context, dragAnimation, inDrag) {
          return AnimatedBuilder(
            animation: dragAnimation,
            builder: (context, _) {
              return SizeFadeTransition(
                sizeFraction: 0.7,
                curve: Curves.easeInOut,
                animation: itemAnimation,
                child: BoxAddOptionWidget(
                  option: option,
                  onDeletePressed: () {
                    deleteOption(index);
                  },
                ),
              );
            },
          );
        },
      );
    }

    return ImplicitlyAnimatedReorderableList<String>(
      items: optionList,
      shrinkWrap: true,
      reorderDuration: const Duration(milliseconds: 200),
      liftDuration: const Duration(milliseconds: 300),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
      onReorderFinished: (oldOption, from, to, newOption) {
        onReorderFinished(newOption);
      },
      itemBuilder: (context, itemAnimation, option, index) {
        return buildReorderable(option, itemAnimation, index);
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

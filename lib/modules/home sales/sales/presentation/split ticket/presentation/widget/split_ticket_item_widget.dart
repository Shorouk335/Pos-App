import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/split%20ticket/cubit/split_ticket_cubit.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplitTicketItemWidget extends StatefulWidget {
  const SplitTicketItemWidget({
    super.key,
    required this.item,
    this.isOutOfStock = false,
    required this.ticketIndex,
    required this.itemIndex,
  });
  final ItemModel item;
  final bool isOutOfStock;
  final int ticketIndex;
  final int itemIndex;

  @override
  State<SplitTicketItemWidget> createState() => _SplitTicketItemWidgetState();
}

class _SplitTicketItemWidgetState extends State<SplitTicketItemWidget> {
  bool currentIsSelected = false;
  late ItemModel currentItem;
  late int currentItemIndex;

  @override
  void initState() {
    currentItem = widget.item;
    currentItemIndex = widget.itemIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SplitTicketItemWidget oldWidget) {
    if (oldWidget.item != widget.item) {
      currentItem = widget.item;
    }
    if (oldWidget.itemIndex != widget.itemIndex) {
      currentItemIndex = widget.itemIndex;
    }
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  changeIsSelectedValue() {
    currentIsSelected = !currentIsSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplitTicketCubit, SplitTicketState>(
      listener: (context, state) {
        if (state is MoveHereSplitTicketState) {
          currentIsSelected = false;
          setState(() {});
        }
      },
      builder: (context, state) {
        final cubit = SplitTicketCubit.get(context);
        return InkWell(
          onTap: () {
            changeIsSelectedValue();
            cubit.selectOrNotSelectItem(
                widget.ticketIndex, currentItemIndex, currentIsSelected);
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: IntrinsicHeight(
              child: ListTile(
                leading: SizedBox(
                  width: 10,
                  child: Checkbox(
                    onChanged: (v) {
                      changeIsSelectedValue();
                      cubit.selectOrNotSelectItem(widget.ticketIndex,
                          currentItemIndex, currentIsSelected);
                    },
                    activeColor: AppColors.primary(context),
                    checkColor: Colors.white,
                    value: currentIsSelected,
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.center,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: currentItem.name ?? "",
                          style: getTextStyle(context, TextType.title)),
                      TextSpan(
                          text: " X ",
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.8),
                              fontSize: 18.0)),
                      TextSpan(
                          text: " 4 ",
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.8),
                              fontSize: 18.0)),
                    ])),
                    Visibility(
                      visible: widget.isOutOfStock,
                      replacement: const SizedBox(
                        height: 0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          CustomText(
                            context: context,
                            text: "out of stock",
                            color: Colors.red,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: CustomText(
                    context: context, text: "${currentItem.total} EGP"),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenTicketDataBoxWidget extends StatefulWidget {
  const OpenTicketDataBoxWidget({
    super.key,
    required this.ticketModel,
    this.onChangedCheck,
    this.onTapBox,
   required this.humenTime
  });
  final TicketModel ticketModel;
  final void Function(bool?)? onChangedCheck;
  final void Function()? onTapBox;
   final String? humenTime ;

  @override
  State<OpenTicketDataBoxWidget> createState() =>
      _OpenTicketDataBoxWidgetState();
}

class _OpenTicketDataBoxWidgetState extends State<OpenTicketDataBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesStates>(
      builder: (context, state) {
        return InkWell(
          onTap: widget.onTapBox,
          child: ListTile(
            leading: InkWell(
              splashColor: Colors.transparent,
              onTap: widget.onTapBox,
              child: SizedBox(
                width: 20,
                child: Checkbox(
                  onChanged: widget.onChangedCheck,
                  activeColor: AppColors.primary(context),
                  checkColor: Colors.white,
                  value: widget.ticketModel.isSelected,
                ),
              ),
            ),
            titleAlignment: ListTileTitleAlignment.center,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(context: context,
                  text: widget.ticketModel.name ?? "mohammmed",
                  type: TextType.title,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    CustomText(context: context,
                      text: widget.ticketModel.customerName ?? "owner",
                      type: TextType.description,
                    ),
                     SizedBox(
                      width: 15.0,
                      child: CustomText(context: context,
                        text: " , ",
                        type: TextType.description,
                      ),
                    ),
                    CustomText(context: context,
                     text: widget.humenTime ?? "",
                      // text: widget.ticketModel.time ?? "",
                      type: TextType.description,
                    ),
                  ],
                )
              ],
            ),
            contentPadding: EdgeInsets.zero,
            trailing: 
            CustomText(context: context,
              text: " EGP ${widget.ticketModel.total ?? ""}",
              type: TextType.title,
              color: AppColors.primary(context),
            ),
          ),
        );
      },
    );
  }
}

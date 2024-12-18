import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditTicketSplitView extends StatefulWidget {
  const EditTicketSplitView({super.key, required this.ticketModel});
  final TicketModel ticketModel;

  @override
  State<EditTicketSplitView> createState() => _EditTicketSplitViewState();
}

class _EditTicketSplitViewState extends State<EditTicketSplitView> {  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: "save_ticket".tr(),
        actions: [
          IgnorePointer(
            ignoring: widget.ticketModel.name == null,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(widget.ticketModel); 
                },
                child: CustomText(context: context,
                  text: "save".tr(),
                  type: TextType.big,
                  color: widget.ticketModel.name == null
                      ? AppColors.normalTextGrey(context)
                      : AppColors.primary(context),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              CustomTextFormField(
                labelText: "name".tr(),
                initialValue: widget.ticketModel.name,
                onChanged: (s) {
                  setState(() {
                    widget.ticketModel.name = s;
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormField(
                labelText: "comment".tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/circle_check_ticket.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class EmployeeBoxWidget extends StatefulWidget {
  const EmployeeBoxWidget({super.key});

  @override
  State<EmployeeBoxWidget> createState() => _EmployeeBoxWidgetState();
}

class _EmployeeBoxWidgetState extends State<EmployeeBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child:  ListTile(
        leading: CircularCheckBox(
          isSelected: true,
        ),
        title: CustomText(context: context,
          text: "Owner",
          type: TextType.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

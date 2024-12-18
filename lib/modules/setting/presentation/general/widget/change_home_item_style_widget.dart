import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/circle_check_ticket.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/svgIcon.dart';
import 'package:flutter/material.dart';

class ChangeHomeItemStyleWidget extends StatelessWidget {
  const ChangeHomeItemStyleWidget(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.txt , 
      required this.pic
      
      });
  final void Function()? onTap;
  final bool isSelected;
  final String txt;
  final String pic ; 

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgIconWithoutColorWidget(
                  svg: pic,
                  size: MediaQuery.of(context).size.height* 0.4,
                ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10.0),
          child: Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                onTap: onTap,
                child: CircularCheckBox(
                  isSelected: isSelected,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              CustomText(context: context,text: txt)
            ],
          ),
        ),
      ],
    );
  }
}

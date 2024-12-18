import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OpenShiftView extends StatefulWidget {
  const OpenShiftView({super.key , required this.onPressed});
  final void Function()? onPressed ; 

  @override
  State<OpenShiftView> createState() => _OpenShiftViewState();
}

class _OpenShiftViewState extends State<OpenShiftView> {
  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        CustomText(context: context,text: "open_shift_text".tr()) ,
        const SizedBox(height: 15.0,) , 
          CustomTextFormField( 
            initialValue: "EGP 0.00",
            labelText: "amount".tr(),
            onChanged: (s){ 
             
            },
           
          ),
          const SizedBox(height: 25.0,) ,
         CustomOutlineButton(
                radius: 0.0,
                onPressed: widget.onPressed  , 
                text: "open_shift".tr(),
                textSize: 20,
              ),
    
    
      ],
    ); 
  }
}
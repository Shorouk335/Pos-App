import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/auth/domain/model/user_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:flutter/material.dart';

class LayoutDrawerHeaderWidget extends StatefulWidget {
  const LayoutDrawerHeaderWidget({super.key});

  @override
  State<LayoutDrawerHeaderWidget> createState() => _LayoutDrawerHeaderWidgetState();
}

class _LayoutDrawerHeaderWidgetState extends State<LayoutDrawerHeaderWidget> {
 late UserModel userModel ;
  @override
  initState(){
    super.initState();
    userModel = HiveService.getUserModelData();

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                context: context,
                text:  userModel.username ?? "Name",
                type: TextType.textButton,
                isWeight: true,
               
              ),
              CustomText(
                context: context,
                text: userModel.name ?? "Name2",
                type: TextType.textButton,
              ),
              CustomText(
                context: context,
                text: userModel.role ?? "Role",
                type: TextType.textButton,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              radius: 25,
              child: Icon(
                Icons.lock_outline,
                color: AppColors.normalTextGrey(context),
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BoxModifiersWidget extends StatefulWidget {
  const BoxModifiersWidget({super.key});

  @override
  State<BoxModifiersWidget> createState() => _BoxModifiersWidgetState();
}

class _BoxModifiersWidgetState extends State<BoxModifiersWidget> { 
    List<bool> modifierSelectList = List.filled(2, false);

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(context: context,
                    text: "modifiers".tr(),
                    color: AppColors.primary(context),
                  ),
                 ListView.builder( 
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index){
                    return  Row(
                    children: [
                      CustomText(context: context,
                        text: "modifier $index",
                      ),
                      const Spacer(),
                      Switch(
                          value: modifierSelectList[index],
                          activeColor: AppColors.primary(context),
                           inactiveTrackColor: Colors.grey.shade100,
                          inactiveThumbColor: Colors.grey.shade400,
                          splashRadius: 0.0,
                          trackOutlineColor:
                              WidgetStateProperty.resolveWith<Color?>(
                                  (Set<WidgetState> states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.transparent;
                            }
                            return Colors.transparent; 
                          }),
                          onChanged: (value) {
                            setState(() {
                              modifierSelectList[index] = value;
                            });
                          })
                    ],
                  );

                  })
                ],
              ),
            );
  }
}
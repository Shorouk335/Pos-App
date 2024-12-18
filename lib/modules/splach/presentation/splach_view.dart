import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/shared/widgets/customButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: AppColors.primary(context),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                    child: Image(image: AssetImage("logo".png())),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CustomButton(
                      //     onPressed: () {
                      //       NavigationService.pushNamed(
                      //           AppRouter.registerRoute);
                      //     },
                      //     text: "register".tr() , 
                      //      textSize: 22, 
                      //     ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      CustomOutlineButton(
                          onPressed: () {
                            NavigationService.pushNamed(AppRouter.loginRoute);
                          },
                          text: "login".tr() ,
                          textSize: 22, 
                          
                          ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppsItemWidget extends StatefulWidget {
  const AppsItemWidget({super.key ,required this.img ,  required this.disc , required this.title , required this.url}); 
  final String img ;
  final String title ;
  final String disc ;
  final String url ;

  @override
  State<AppsItemWidget> createState() => _AppsItemWidgetState();
}

class _AppsItemWidgetState extends State<AppsItemWidget> {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse("https://flutter.dev"))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: AppColors.backgroundColorMode(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 80.0, width: 80.0, child: Image.asset(widget.img.png())),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(context: context,
                  text: widget.title,
                  isWeight: true,
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustomText(context: context,
                  text:
                      widget.disc,
                  type: TextType.description,
                  color: AppColors.textNormalColor(context),
                ),
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                    onTap: () {
                      _launchUrl(widget.url);
                    },
                    child: CustomText(context: context,
                      text: "get_it_in_google_play".tr(),
                      type: TextType.big,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum SettingType { printers, customerDisplay, taxes, printerGroup }

class EmptySettingTypeWidget extends StatefulWidget {
  const EmptySettingTypeWidget({super.key, required this.settingType});
  final SettingType settingType;

  @override
  State<EmptySettingTypeWidget> createState() => _EmptySettingTypeWidgetState();
}

class _EmptySettingTypeWidgetState extends State<EmptySettingTypeWidget> {
  String? title;
  String? disc;
  IconData? icon;

  getSettingType(SettingType settingType) {
    switch (settingType) {
      case SettingType.printers:
        {
          title = "printers_txt".tr();
          disc = "printers_disc".tr();
          icon = Icons.print;
        }
      case SettingType.customerDisplay:
        {
          title = "display_txt".tr();
          disc = "display_disc".tr();
          icon = Icons.tv;
        }
      case SettingType.taxes:
        {
          title = "taxes_txt".tr();
          disc = "taxes_disc".tr();
          icon = Icons.percent;
        }
      case SettingType.printerGroup:
        {
          title = "printer_groups_text".tr();
          disc = "printer_groups_disc".tr();
          icon = Icons.print;
        }
    }
  }

  @override
  initState() {
    super.initState();
    getSettingType(widget.settingType);
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: widget.settingType == SettingType.printerGroup ?60.0 : 80.0,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: Icon(
                icon,
                size:widget.settingType == SettingType.printerGroup ?60.0 : 80.0,
                color: AppColors.normalTextGrey(context),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomText(context: context,
              text: title ?? "",
              color: AppColors.normalTextGrey(context),
              size: widget.settingType == SettingType.printerGroup ?18.0 : 22,
            ),
            CustomText(context: context,
              text: disc ?? "",
              color: AppColors.normalTextGrey(context),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                _launchUrl('https://flutter.dev');
              },
              child: Text( 
                widget.settingType == SettingType.printerGroup ? "back_office".tr() :
                "learn_more".tr(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}

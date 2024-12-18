import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum SalesItemType { items, categories, modifiers, discounts }

class EmptySalesItemWidget extends StatefulWidget {
  const EmptySalesItemWidget({super.key, required this.salesItemType});
  final SalesItemType salesItemType;

  @override
  State<EmptySalesItemWidget> createState() => _EmptySalesItemWidgetState();
}

class _EmptySalesItemWidgetState extends State<EmptySalesItemWidget> {
  String? title;
  String? disc;
  IconData? icon;

  getSalesItemType(SalesItemType salesItemType) {
    switch (salesItemType) {
      case SalesItemType.items:
        {
          title = "empty_item_txt".tr();
          disc = "empty_item_disc".tr();
          icon = Icons.list;
        }
      case SalesItemType.categories:
        {
          title = "empty_categories_txt".tr();
          disc = "empty_categories_disc".tr();
          icon = Icons.filter_none;
        }
      case SalesItemType.modifiers:
        {
          title = "empty_modifiers_txt".tr();
          disc = "empty_modifiers_disc".tr();
          icon = Icons.task_outlined;
        }
      case SalesItemType.discounts:
        {
          title = "empty_discounts_txt".tr();
          disc = "empty_discounts_disc".tr();
          icon = Icons.discount_outlined;
        }
    }
  }

  @override
  initState() {
    super.initState();
    getSalesItemType(widget.salesItemType);
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
              radius: 80.0,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: Icon(
                icon,
                size: 80.0,
                color: AppColors.normalTextGrey(context),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomText(context: context,
              text: title ?? "",
              color: AppColors.normalTextGrey(context),
              size: 22,
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

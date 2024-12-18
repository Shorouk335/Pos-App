import 'package:e_ticket_app/core/data_service/PrefService/prefService.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/setting/presentation/general/widget/change_home_item_style_widget.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeHomeScreenLayoutView extends StatefulWidget {
  const ChangeHomeScreenLayoutView({super.key});

  @override
  State<ChangeHomeScreenLayoutView> createState() =>
      _ChangeHomeScreenLayoutViewState();
}

class _ChangeHomeScreenLayoutViewState
    extends State<ChangeHomeScreenLayoutView> {
  bool isSelectedList = false;
  bool isSelectedGrid = false;
  @override
  void initState() {
  PrefService.itemStyle == "grid"
            ? isSelectedGrid = true
            : isSelectedList = true;
    super.initState();
  }

  changeHomeStyle() {
    setState(() {
      isSelectedList = !isSelectedList;
      isSelectedGrid = !isSelectedGrid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: "home_screen_item_layout".tr(),
        actions: [
          TextButton(
              onPressed: () {
                PrefService.itemStyle =
                    isSelectedList == true ? "list" : "grid";

                Navigator.of(context).pop("save");
              },
              child: CustomText(
                context: context,
                text: "save".tr(),
                color: AppColors.primary(context),
                size: 20,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ChangeHomeItemStyleWidget(
                  onTap: () {
                    changeHomeStyle();
                  },
                  isSelected: isSelectedList,
                  txt: "list".tr(),
                  pic: isSelectedList ? "list_color" : "list_gray"),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: ChangeHomeItemStyleWidget(
                  onTap: () {
                    changeHomeStyle();
                  },
                  isSelected: isSelectedGrid,
                  txt: "grid".tr(),
                  pic: isSelectedGrid ? "grid_color" : "grid_gray"),
            ),
          ],
        ),
      ),
    );
  }
}

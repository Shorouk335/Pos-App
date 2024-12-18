import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/modules/layout/manager/layout_cubit.dart';
import 'package:e_ticket_app/shared/widgets/svgIcon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LayoutDrawerItemWidget extends StatefulWidget {
  const LayoutDrawerItemWidget(
      {super.key,
      required this.index,
      required this.title,
      this.icon,
      this.isSvgIcon = false,
      this.svgIcon});
  final int index;
  final String title;
  final IconData? icon;
  final bool isSvgIcon;
  final String? svgIcon;

  @override
  State<LayoutDrawerItemWidget> createState() => _LayoutDrawerItemWidgetState();
}

class _LayoutDrawerItemWidgetState extends State<LayoutDrawerItemWidget> {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  openBackOffice() {
    _launchUrl('https://flutter.dev');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: AppColors.primary(context),
      iconColor: AppColors.normalTextGrey(context),
      textColor: AppColors.textNormalColor(context),
      selectedTileColor: Colors.grey.withOpacity(0.08),
      title: Row(
        children: [
          widget.isSvgIcon
              ? SvgIconWidget(
                  svg: widget.svgIcon ?? "app_logo",
                  size: 20.0,
                  color: LayoutCubit.get(context).currentIndex == 5
                      ? AppColors.primary(context)
                      : AppColors.normalTextGrey(context),
                )
              : Icon(
                  widget.icon,
                  size: 22.0,
                ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 18.0),
          )
        ],
      ),
      selected: LayoutCubit.get(context).currentIndex == widget.index,
      onTap: () {
        if (widget.index == -1) {
          openBackOffice();
        } else {
          LayoutCubit.get(context).changeLayoutScreen(widget.index);
          Navigator.pop(context);
        }
      },
    );
  }
}

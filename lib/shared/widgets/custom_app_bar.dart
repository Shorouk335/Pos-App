import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDarkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomDarkAppBar(
      {super.key,
      this.title,
      this.actions,
      this.size,
      this.onBackPressed,
      this.titleWidget,
      this.iconBack});
  final String? title;
  final List<Widget>? actions;
  final double? size;
  final Widget? titleWidget;
  final void Function()? onBackPressed;
  final IconData? iconBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.dividerColor(context),
          ),
        ),
      ),
      child: AppBar(
        toolbarHeight: 70.0,
        automaticallyImplyLeading: false,
        leadingWidth: 60.0,
        title: titleWidget ??
            CustomText(
              context: context,
              text: title ?? "",
              type: TextType.textButton,
              size: size,
            ),
        leading: IconButton(
          onPressed: onBackPressed ??
              () {
                NavigationService.popPage();
              },
          icon: Icon(
            iconBack ?? Icons.arrow_back,
            color: Colors.white,
          ),
          iconSize: 25.0,
          color: AppColors.backgroundColorMode(context),
        ),
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}

class CustomLightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomLightAppBar(
      {super.key,
      this.title,
      this.actions,
      this.iconBack,
      this.leading,
      this.onBackPressed});
  final String? title;
  final List<Widget>? actions;
  final IconData? iconBack;
  final Widget? leading;
  final void Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.dividerColor(context),
          ),
        ),
      ),
      child: Center(
        child: AppBar(
          toolbarHeight: 70.0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          automaticallyImplyLeading: false,
          leading: leading ??
              IconButton(
                icon: Icon(
                  iconBack ?? Icons.close,
                  color: AppColors.textNormalColor(context),
                  size: 25.0,
                ),
                onPressed: onBackPressed ??
                    () {
                      NavigationService.popPage();
                    },
              ),
          title: CustomText(
            context: context,
            text: title ?? "",
            type: TextType.big,
            color: AppColors.textNormalColor(context),
          ),
          actions: actions,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}

class CustomDrawerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomDrawerAppBar(
      {super.key,
      required this.onMenuPressed,
      required this.title,
      this.actions});
  final void Function()? onMenuPressed;
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.dividerColor(context),
          ),
        ),
      ),
      child: AppBar(
        leadingWidth: 70.0,
        title: CustomText(
          context: context,
          text: title,
          size: 22,
          color: Colors.white,
        ),
        leading: IconButton(
          onPressed: onMenuPressed,
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class CustomSalesItemWithSearchAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomSalesItemWithSearchAppBar(
      {super.key, this.title, this.actions, this.size, this.titleWidget});
  final String? title;
  final List<Widget>? actions;
  final double? size;
  final Widget? titleWidget;

  @override
  State<CustomSalesItemWithSearchAppBar> createState() =>
      _CustomSalesItemWithSearchAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}

class _CustomSalesItemWithSearchAppBarState
    extends State<CustomSalesItemWithSearchAppBar> {
  bool isSearch = false;

  transformToPopMenuAndSearchForm() {
    isSearch = !isSearch;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.dividerColor(context),
          ),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 70.0,
        leading: IconButton(
          onPressed: () {
            isSearch
                ? transformToPopMenuAndSearchForm()
                : NavigationService.popPage();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          iconSize: 25.0,
          color: AppColors.backgroundColorMode(context),
        ),
        title: Visibility(
          visible: !isSearch,
          replacement: CustomTextFormField(
            fillColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.primary(context)
                : AppColors.backgroundColorMode(context),
            cursorColor: Colors.white,
            hintText: "search".tr(),
            hintColor: Colors.white60,
            isSearch: true,
            textColor: Colors.white,
            onChanged: (s) {},
          ),
          child: widget.titleWidget ??
              CustomText(
                context: context,
                text: widget.title ?? "",
                type: TextType.textButton,
                size: widget.size,
              ),
        ),
        actions: [
          Visibility(
            visible: !isSearch,
            child: IconButton(
              onPressed: () {
                transformToPopMenuAndSearchForm();
              },
              icon: Icon(
                Icons.search,
                color:Colors.white,
              ),
              iconSize: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}

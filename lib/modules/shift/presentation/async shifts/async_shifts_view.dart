import 'package:e_ticket_app/modules/shift/presentation/async%20shifts/widget/async_shift_item_widget.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AsyncShiftsView extends StatelessWidget {
  const AsyncShiftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightAppBar(
        title: "shifts".tr(),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 3.0),
              child: Divider(),
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return const AsyncShiftItemWidget();
          }),
    );
  }
}

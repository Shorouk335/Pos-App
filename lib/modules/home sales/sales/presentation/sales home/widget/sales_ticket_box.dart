import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/charge_ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesTicketBoxWidget extends StatefulWidget {
  const SalesTicketBoxWidget({super.key, this.withShadow = true});
  final bool withShadow;

  @override
  State<SalesTicketBoxWidget> createState() => _SalesTicketBoxWidgetState();
}

class _SalesTicketBoxWidgetState extends State<SalesTicketBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesCubit, SalesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SalesCubit.get(context);
        return Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.primary(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Visibility(
                  visible: cubit.ticketModel.items.isEmpty,
                  replacement: TextButton(
                      onPressed: () {
                        cubit.ticketModel.name == null
                            ? NavigationService.pushNamed(
                                AppRouter.saveTicketRoute,
                                extra: false)
                            : cubit.saveTicketToDB();
                      },
                      child: CustomText(
                        context: context,
                        text: "save".tr(),
                        type: TextType.textButton,
                      )),
                  child: IgnorePointer(
                    ignoring: HiveService.checkEmptyTicketListDB(),
                    child: TextButton(
                        onPressed: () {
                          NavigationService.pushNamed(
                              AppRouter.openTicketRoute);
                        },
                        child: CustomText(
                          context: context,
                          text: "openTicket".tr(),
                          type: TextType.textButton,
                          color: HiveService.checkEmptyTicketListDB()
                              ? Colors.white.withOpacity(0.5)
                              : null,
                        )),
                  ),
                ),
              ),
              const VerticalDivider(
                color: Colors.white,
                thickness: 1.5,
              ),
              Expanded(
                flex: 1,
                child: IgnorePointer(
                  ignoring: cubit.ticketModel.items.isEmpty,
                  child: TextButton(
                    onPressed: () {
                      NavigationService.pushNamed(AppRouter.chargeTicketRoute,
                          extra: ChargePriceTicketPageModel(
                            currentPrice: cubit.ticketModel.total ?? 0.0,
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          context: context,
                          text: "charge".tr(),
                          type: TextType.textButton,
                          color: cubit.ticketModel.items.isEmpty
                              ? Colors.white.withOpacity(0.5)
                              : null,
                        ),
                        CustomText(
                          context: context,
                          text: "${cubit.ticketModel.total ?? "0.00"} EGP",
                          type: TextType.textButton,
                          overflow: TextOverflow.ellipsis,
                          color: cubit.ticketModel.items.isEmpty
                              ? Colors.white.withOpacity(0.5)
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

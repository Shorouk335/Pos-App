import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/core/router/router.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/open%20ticket/open_ticket_cubit.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/open%20ticket/open_ticket_states.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/open_ticket_data_box.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/presentation/widget/sort%20by/sort_pop_up_widget.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/widgets/customText.dart';
import 'package:e_ticket_app/shared/widgets/custom_app_bar.dart';
import 'package:e_ticket_app/shared/widgets/textFormField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';

class MergeWithTicketView extends StatefulWidget {
  const MergeWithTicketView({super.key, required this.ticketModel});
  final TicketModel ticketModel;

  @override
  State<MergeWithTicketView> createState() => _MergeWithTicketViewState();
}

class _MergeWithTicketViewState extends State<MergeWithTicketView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OpenTicketCubit()..getOpenTicketData(),
      child: BlocConsumer<OpenTicketCubit, OpenTicketStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OpenTicketCubit.get(context);
          return Scaffold(
            appBar: CustomLightAppBar(
              title: "merge_with".tr(),
              actions: [
                IgnorePointer(
                  ignoring: !cubit.isSelectedOrNotTicket(),
                  child: TextButton(
                      onPressed: () {
                        NavigationService.pushNamed(AppRouter.mergeTicketRoute,
                            extra: cubit.getSelectedTicketWithCurrentTicket(
                                widget.ticketModel));
                      },
                      child: CustomText(context: context,
                        text: "continue".tr(),
                        type: TextType.big,
                        color: !cubit.isSelectedOrNotTicket()
                            ? Colors.grey.withOpacity(0.5)
                            : AppColors.primary(context),
                      )),
                )
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Visibility(
                    visible: cubit.isSearch,
                    replacement: Row(
                      children: [
                        const SizedBox(
                          width: 20.0,
                        ),
                        SizedBox(
                          width: 10,
                          child: Checkbox(
                            onChanged: (v) {
                              cubit.selectAllOpenTicketCheckBox();
                            },
                            activeColor: AppColors.primary(context),
                            value: cubit.isSelectedAll,
                          ),
                        ),
                        const Spacer(),
                        const SortPopUpWidget(),
                        SizedBox(
                          width: 30,
                          child: IconButton(
                              onPressed: () {
                                cubit.changeSearchOrOpenTicketModel(true);
                              },
                              icon:  Icon(Icons.search , color: AppColors.normalTextGrey(context),)),
                        )
                      ],
                    ),
                    child: CustomTextFormField(
                      hintText: "search".tr(),
                      suffixWidget:  IconButton(
                        onPressed: () {
                        cubit.changeSearchOrOpenTicketModel(false);
                      } ,
                        icon:  Icon(
                          Icons.close,
                          color: AppColors.normalTextGrey(context),
                          size: 20.0,
                        ),
                      ),
                      
                     
                      isSearch: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      onChanged: (s) {
                        cubit.searchInTicketFromDBList(s);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomText(context: context,
                    text: "my_tickets".tr(),
                    type: TextType.big,
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ImplicitlyAnimatedReorderableList<TicketModel>(
                      items: cubit.isSearch
                          ? cubit.ticketSearchList
                          : cubit.ticketFromDBList,
                      areItemsTheSame: (oldItem, newItem) => oldItem == newItem,
                      onReorderFinished: (item, from, to, newItems) {
                        setState(() {
                          if (cubit.isSearch) {
                            cubit.ticketSearchList
                              ..clear()
                              ..addAll(newItems);
                          } else {
                            cubit.ticketFromDBList
                              ..clear()
                              ..addAll(newItems);
                          }
                        });
                      },
                      itemBuilder: (context, itemAnimation, item, index) {
                        return Reorderable(
                          key: ValueKey(item),
                          builder: (context, dragAnimation, inDrag) {
                            return SizeFadeTransition(
                              sizeFraction: 0.7,
                              curve: Curves.easeInOut,
                              animation: itemAnimation,
                              child: OpenTicketDataBoxWidget(
                                ticketModel: item,
                                
                                humenTime: cubit.getTicketHumaneTime(item.dataTime!),
                                onTapBox: () {},
                                onChangedCheck: (value) {
                                 
                                    cubit
                                        .changeValueOfOpenTicketCheckBox(item);
                                  
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

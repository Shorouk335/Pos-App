import 'package:e_ticket_app/modules/apps/presentation/apps_view.dart';
import 'package:e_ticket_app/modules/sales%20items/presentation/sales_items_view.dart';
import 'package:e_ticket_app/modules/layout/manager/layout_states.dart';
import 'package:e_ticket_app/modules/receipts/presentation/receipts_view.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/sales%20home/sales_view.dart';
import 'package:e_ticket_app/modules/setting/presentation/setting_view.dart';
import 'package:e_ticket_app/modules/shift/presentation/shift_view.dart';
import 'package:e_ticket_app/modules/support/presetation/support_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> screensList = [
    const SalesView(),
    const ReceiptsView(),
    const ShiftView(),
    const SalesItemsView(),
    const SettingView(), 
    const AppsView(), 
    const SupportView(), 
  ];

  changeLayoutScreen(index) {
    currentIndex = index;
    emit(ChangeLayoutScreenState());
  } 

 int getCurrentDrawerIndex() {
  return currentIndex ; 
  }
}

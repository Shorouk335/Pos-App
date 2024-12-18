import 'dart:developer';
import 'package:e_ticket_app/core/app_utils/extension.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/open%20ticket/open_ticket_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class OpenTicketCubit extends Cubit<OpenTicketStates> {
  OpenTicketCubit() : super(InitialOpenTicketDataStates());

  static OpenTicketCubit get(context) => BlocProvider.of(context);

  List<TicketModel> ticketFromDBList = <TicketModel>[];
  List<TicketModel> ticketBeforeSortList = <TicketModel>[]; // using for sort

  // select all
  bool isSelectedAll = false;

  //searh
  bool isSearch = false;
  List<TicketModel> ticketSearchList = <TicketModel>[];

//////////////////////INITIAL////////////
  getOpenTicketData() {
    ticketFromDBList = HiveService.getTicketListDB();
    for (var element in ticketFromDBList) {
      element.isSelected = false;
    }
    ticketFromDBList.sort((a, b) => a.name!.compareTo(b.name!));
    emit(GetOpenTicketDataStates());
  }

/////////////////////SORT/////////////////////
  sortByName() {
    ticketBeforeSortList = List.from(ticketFromDBList);
    ticketFromDBList.sort((a, b) => a.name!.compareTo(b.name!));
    ticketBeforeSortList = <TicketModel>[];
    emit(SortByNameTicketStates());
  }

  sortByTime() {
    ticketBeforeSortList = List.from(ticketFromDBList);
    ticketFromDBList.sort((a, b) => b.dataTime.toString().timeFormate.compareTo(a.dataTime.toString().timeFormate));
    ticketBeforeSortList = <TicketModel>[];
    emit(SortByTimeTicketStates());
  }

  sortByAmount() {
    ticketBeforeSortList = List.from(ticketFromDBList);
    ticketFromDBList
        .sort((a, b) => b.total!.compareTo(a.total!));
    ticketBeforeSortList = <TicketModel>[];
    emit(SortByAmountTicketStates());
  }

  sortByEmployee() {
    ticketBeforeSortList = List.from(ticketFromDBList);
    ticketFromDBList.sort((a, b) => a.employeeName!.compareTo(b.employeeName!));
    ticketBeforeSortList = <TicketModel>[];
    emit(SortByEmployeeTicketStates());
  }

///////////////////////SELECT CHECK BOX /////////////////////////////

  changeValueOfOpenTicketCheckBox(TicketModel ticket) {
    ticket.isSelected = !ticket.isSelected! ; 
    // ticketFromDBList[index].isSelected == true
    //     ? ticketFromDBList[index].isSelected = false
    //     : ticketFromDBList[index].isSelected = true;
    emit(ChangeSelectTicketStates());
  }

  bool isSelectedOrNotTicket() {
    return ticketFromDBList.any((element) => element.isSelected == true);
  }

  bool isAvailableToMargeTicket() {
    var result = ticketFromDBList
        .where((element) => element.isSelected == true)
        .toList();
    if (result.length >= 2) {
      return true;
    } else {
      return false;
    }
  }

  selectAllOpenTicketCheckBox() {
    isSelectedAll = !isSelectedAll;
    for (var element in ticketFromDBList) {
      element.isSelected = isSelectedAll;
    }
    emit(SelectAllOpenTicketStates());
  }

///////////////////////////////////////DELETE///////////////////////////
  deleteOpenTicketFromDB() {
    List<String> keysDeleteList = <String>[];
    for (int i = 0; i < ticketFromDBList.length; i++) {
      if (ticketFromDBList[i].isSelected == true) {
        keysDeleteList.add(ticketFromDBList[i].uuid ?? "");
      }
    }

    log(keysDeleteList.toList().toString());
    HiveService.clearTicketList(keysDeleteList);
    isSelectedAll = false;
    getOpenTicketData();
    if (isSearch == true) {
      ticketSearchList = ticketFromDBList;
    }
  }

///////////////////////////////////////TICKET TO MERGE///////////////////////////////
  List<TicketModel> getSelectedTicket() {
    List<TicketModel> selectedTicket = <TicketModel>[];
    for (int i = 0; i < ticketFromDBList.length; i++) {
      if (ticketFromDBList[i].isSelected == true) {
        selectedTicket.add(ticketFromDBList[i].copy());
      }
    }
    log(selectedTicket.length.toString());
    return selectedTicket;
  }

//////////////////////////////MERGE WITH /////////////////////
  List<TicketModel> getSelectedTicketWithCurrentTicket(
      TicketModel ticketModel) {
    List<TicketModel> selectedTicket = <TicketModel>[];
    for (int i = 0; i < ticketFromDBList.length; i++) {
      if (ticketFromDBList[i].isSelected == true) {
        selectedTicket.add(ticketFromDBList[i]);
      }
    }
    selectedTicket.add(ticketModel);
    return selectedTicket;
  }

/////////////////////////////////SEARCH /////////////////////

  changeSearchOrOpenTicketModel(bool searchType) {
    isSearch = searchType;
    // in first search
    if (isSearch == true) {
      ticketSearchList = ticketFromDBList;
    }
    emit(ChangeSearchModelOpenTicketState());
  }

  searchInTicketFromDBList(String searchText) {
    ticketSearchList = ticketFromDBList
        .where((element) => element.name!.contains(searchText))
        .toList();
    if (ticketSearchList.isNotEmpty) {
      emit(SuccessSearchInOpenTicketState());
    } else {
      // if empty all select remove 
      for (var element in ticketFromDBList) {
        element.isSelected = false;
      }
      emit(ErrorSearchInOpenTicketState());
    }
  }

  ///////////////////TIME Humane /////////////////

  String getTicketHumaneTime(DateTime ticketTime) {
    return timeago.format(ticketTime);
  }
}


import 'package:e_ticket_app/core/app_utils/utils.dart';
import 'package:e_ticket_app/core/constant/constant.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/home%20sales/open%20ticket/manager/merge%20ticket/merge_ticket_state.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MergeTicketCubit extends Cubit<MergeTicketState> {
  MergeTicketCubit() : super(InitialMergeTicketState());
  static MergeTicketCubit get(context) => BlocProvider.of(context);

  List<TicketModel> margeTicketList = <TicketModel>[];
  // selected MergeTicket
  TicketModel selectedMergeTicket = TicketModel();
  //check value
  // List<bool> isSelectedTicket = <bool>[];

  initialDateOfMargeTicket(List<TicketModel> margeTickets) {
    margeTicketList = margeTickets;
    margeTicketList.forEach((element){
        element.isSelected = false ;
    });
    margeTicketList[0].isSelected= true;
    selectedMergeTicket = margeTicketList[0];
    emit(InitialDataMergeTicketStates());
  }

  changeValueOfMargeTicketCheckBox(int index) {
   margeTicketList.forEach((element){
        element.isSelected = false ;
    });
    margeTicketList[index].isSelected= true;
    selectedMergeTicket = margeTicketList[index];
    emit(ChangeSelectTicketStates());
  }
  //Merge ===>
  // Delete all ticket
  //create new Ticket in new time

  mergeTicketInDB() {
    // all key of list to delete
    List<String> keysDeleteList = <String>[];
    // total
    num selectedMergeTotal =
        selectedMergeTicket.total  ?? 0.0;

    for (int i = 0; i < margeTicketList.length; i++) {
      
      keysDeleteList.add(margeTicketList[i].uuid ?? "");
      if (margeTicketList[i].isSelected == false) {
        //TOTAL
        selectedMergeTotal +=
            margeTicketList[i].total ?? 0.0;
        //ITEM
        for (var item in margeTicketList[i].items) {
          selectedMergeTicket.items.add(item);
        }
      }
    }
    //delete all ticket
    HiveService.clearTicketList(keysDeleteList);

    // set new time to ticket
    selectedMergeTicket.total = selectedMergeTotal;
    selectedMergeTicket.dataTime = DateTime.now();
    selectedMergeTicket.uuid ??= Utils.getId();
    selectedMergeTicket.ticketType ??= kDineIn;
    for (var element in selectedMergeTicket.items) {
      element.isSaved = true;
    }
    HiveService.updateTicket(selectedMergeTicket);
    emit(CompleteMergeTicketStates());
  }
}

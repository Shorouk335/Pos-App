import 'package:e_ticket_app/core/app_utils/utils.dart';
import 'package:e_ticket_app/core/constant/constant.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'split_ticket_state.dart';

class SplitTicketCubit extends Cubit<SplitTicketState> {
  SplitTicketCubit() : super(InitialSplitTicketState());

  static SplitTicketCubit get(context) => BlocProvider.of(context);

  TicketModel originalTicketModel = TicketModel(items: <ItemModel>[]);

  //  tickets
  List<TicketModel> ticketList = <TicketModel>[];

  //selected index Map { "index of ticketList" : [index of item]}
  Map<int, List<int>> itemSelectIndexMap = <int, List<int>>{};

  initialSplitTicketList(TicketModel ticketModel) {
    originalTicketModel = ticketModel;
    ticketList.addAll([
      ticketModel,
      TicketModel(name: "${ticketModel.name!} - 1 ", items: <ItemModel>[])
    ]);

    emit(StartSplitTicketState());
  }

  addNewTicket() {
    ticketList.add(TicketModel(
        name: "${originalTicketModel.name} - ${ticketList.length} ",
        items: <ItemModel>[]));

    emit(AddNewTicketSplitTicketState());
  }
 
 // every click in ckeck box
 //select item or not select to save in {map}
 // before make move 
  selectOrNotSelectItem(int ticketIndex, int itemTicket, bool isSelected) {
    if (isSelected) {
      addToItemsSelected(ticketIndex, itemTicket);
    } else {
      deleteFromItemsSelected(ticketIndex, itemTicket);
    }
    print(itemSelectIndexMap.entries);

    emit(AddOrDeleteItemSplitTicketState());
  }

  addToItemsSelected(int ticketIndex, int itemTicket) { 
    // if ticket in map 
    if (itemSelectIndexMap.containsKey(ticketIndex)) {
      List<int> oldItemIndex = itemSelectIndexMap[ticketIndex] ?? [];
      oldItemIndex.add(itemTicket);
      itemSelectIndexMap.update(ticketIndex, (value) => oldItemIndex);
    } else {
      // if new ticket in map
      itemSelectIndexMap.addAll({
        ticketIndex: [itemTicket]
      });
    }
  }

  deleteFromItemsSelected(int ticketIndex, int itemTicket) {
    List<int> oldItemIndex = itemSelectIndexMap[ticketIndex] ?? [];
    oldItemIndex.remove(itemTicket);
    itemSelectIndexMap.update(ticketIndex, (value) => oldItemIndex);
  }


  moveItemsToHereTicket(int ticketIndexToMove) {
    List<ItemModel> itemsListToMove = <ItemModel>[];
    num addTotal = 0;

    // get item selected
    // add total of them
    itemSelectIndexMap.forEach((key, value) {
      if (value != []) {
        for (var itemIndex in value) {
          itemsListToMove.add(ticketList[key].items[itemIndex]);
          addTotal += ticketList[key].items[itemIndex].total ?? 0;
        }
      }
    });
    //remove Item from  it's Ticket
    //delete item total from it's tickets
    itemSelectIndexMap.forEach((key, value) {
      if (value != []) {
        for (var itemIndex in value) {
          // total of ticket
          num deleteTotal = ticketList[key].total ?? 0.0;
          // delete item total from ticket total 
          ticketList[key].total =
              (deleteTotal - ticketList[key].items[itemIndex].total!)
                  ;
          // delete item from ticket
          ticketList[key].items.removeAt(itemIndex);
        }
      }
    });

    //Finally Add
    ticketList[ticketIndexToMove].items.addAll(itemsListToMove);
    ticketList[ticketIndexToMove].total =
        (ticketList[ticketIndexToMove].total ?? 0.0) + addTotal
           ;
    itemSelectIndexMap.clear();

    emit(MoveHereSplitTicketState());
  }

  // bool checkOfAvailableItemButton(int index) {
  //   if (itemSelectIndexMap.isEmpty) {
  //     return false;
  //   } else {
  //     return itemSelectIndexMap.keys.toList().any(
  //         (element) => element != index && itemSelectIndexMap[element] != []);
  //   }
  // }

  List<TicketModel> getFinalSplitTicketsToSave() {
    List<TicketModel> finalTickets = <TicketModel>[];
    for (int i = 0; i < ticketList.length; i++) {
      if (ticketList[i].items.isNotEmpty) {
        ticketList[i].dataTime = DateTime.now();
        ticketList[i].uuid ??= Utils.getId();
        ticketList[i].ticketType ??= kDineIn;
        for (var element in ticketList[i].items) {
          element.isSaved = true;
        }
        finalTickets.add(ticketList[i]);
      }
    }
    return finalTickets;
  }
}

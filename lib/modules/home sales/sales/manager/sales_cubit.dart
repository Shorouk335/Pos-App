import 'package:e_ticket_app/core/app_utils/utils.dart';
import 'package:e_ticket_app/core/constant/constant.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/core/router/navigation_service.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/manager/sales_states.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/presentation/items%20bar/manager/item_home_style_service.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesCubit extends Cubit<SalesStates> {
  SalesCubit() : super(InitialSalesStates());
  static SalesCubit get(context) => BlocProvider.of(context);

  //######################## TICKET PARAMETER #########################
  TicketModel ticketModel =
      TicketModel(items: <ItemModel>[], discountList: <DiscountModel>[]);
  double totalDiscountPercentage = 0.0;
  double totalDiscountValue = 0.0;

  // ######################## ITEMS #########################
  /// it is list of models to try only
  /// manage when get the correct model
  ///  salary ====> price
  ///  total =====> count * salary
  ///
  List<ItemModel> items = [
    ItemModel(
        name: "item 1", isSelected: false, shape: "sun", color: 0, salary: 50),
    ItemModel(
        name: "item 2",
        isSelected: false,
        shape: "circle",
        color: 1,
        salary: 80),
    ItemModel(name: "item 3", isSelected: false, shape: "octagon", color: 2),
    ItemModel(name: "item 4", isSelected: false, shape: "square", color: 3),
    ItemModel(name: "item 5", isSelected: false, shape: "sun", color: 4),
    ItemModel(name: "item 6", isSelected: false, shape: "square", color: 5),
    ItemModel(name: "item 7", isSelected: false, shape: "octagon", color: 6),
    ItemModel(name: "item 8", isSelected: false, shape: "circle", color: 7),
  ];

  //######################## FAVORITE ITEMS #########################
  List<ItemModel> favoriteItemsList = <ItemModel>[];

  getFavoriteListFromDB() {
    favoriteItemsList = HiveService.getFavoriteList();
    emit(GetFavoriteListFromDBState());
  }

  changeFavoriteList(List<ItemModel> favoritesList) {
    favoriteItemsList = favoritesList;
    emit(ChangeFavoriteListState());
  }

  //######################## SALES PAGE #########################

  bool isSearch = false;

  ItemHomeStyle itemHomeStyle = ItemHomeStyle.normal;

  String itemPopUpSelect = "all_items";

  changeIsSearchInItem(bool isSearchType) {
    isSearch = isSearchType;
    emit(ChangeSearchInItemsSalesStates());
  }

  changeShowTypeItems(ItemHomeStyle style, String itemSelect) {
    itemHomeStyle = style;
    itemPopUpSelect = itemSelect;
    NavigationService.popPage();
    emit(ChangeShowItemsSalesStates());
  }

  //######################## IN SELECT ITEM AND ADD TO TICKET #########################

  // add item only once then if add again ++ count
  addItemToTicket(ItemModel item) {
    int index = ticketModel.items.indexWhere((element) => element == item);
    // item found ====> change total and count
    if (index != -1) {
      ticketModel.items[index].count = ticketModel.items[index].count! + 1;
      num salary = ticketModel.items[index].salary ?? 0.0;
      num count = ticketModel.items[index].count ?? 0.0;
      ticketModel.items[index].total = count * salary;
      //  new add item
    } else {
      item.total = item.salary;
      item.count = 1;
      ticketModel.items.add(item);
    }
    changeTicketTotalSalaryAndTotalDiscount();
    emit(AddItemToTicketStates());
  }

//############################## SAVE TICKET #################################

  /// if ticket save before not show name page
  /// call in save button ====> save before ====> not create name ====> not show save page
  ///                     ====> new ticket  ====> create name ====> show save page
  saveTicketToDB({String? name}) async {
    if (name != null) {
      ticketModel.name = name;
    }
    ticketModel.uuid ??= Utils.getId();
    ticketModel.ticketType ??= kDineIn;
    // in ticket details item saved can not be able to change
    for (var element in ticketModel.items) {
      element.isSaved = true;
    }
    ticketModel.dataTime = DateTime.now();
    await HiveService.addTicketToDB(ticketModel).then((value) {
      ticketModel =
          TicketModel(items: <ItemModel>[], discountList: <DiscountModel>[]);
      totalDiscountPercentage = 0.0;
      totalDiscountValue = 0.0;
    });
    emit(SaveTicketSalesStates());
  }

//########################## ADD CUSTOMER ############################
  changeCustomerName(String? name) {
    ticketModel.customerName = name;
    emit(ChangeCustomerNameInTicketSalesStates());
  }

//########################### OPEN TICKET FUNCTIONS ##################

////////////////// when delete ticket from data base //////////////////////
// to sales page listen this changed if database empty
  deleteOpenTicketFromDB() {
    emit(DeleteOpenTicketSalesStates());
  }

  changeCurrentTicketFromDB(TicketModel ticket) {
    ticketModel = ticket;
    changeDiscountVariablesInTicket();
    HiveService.clearTicket(ticket.uuid ?? "");
    emit(ChangeTicketSalesStates());
  }

////////////////////// POP UP MENU BUTTONS /////////////////////////

  deleteCurrentTicket() {
    ticketModel =
        TicketModel(items: <ItemModel>[], discountList: <DiscountModel>[]);
    totalDiscountPercentage = 0.0;
    totalDiscountValue = 0.0;
    emit(DeleteCurrentTicketSalesStates());
  }

  editTicketName(String name) {
    ticketModel.name = name;
    emit(EditCustomerTicketSalesStates());
  }

  editEmployeeTicket(String employee) {
    ticketModel.employeeName = employee;
    emit(EditEmployeeTicketSalesStates());
  }

/////////////////////TICKET DETAILS PAGE /////////////////////

  editItemInTicket({required ItemModel item, required int index}) {
    ticketModel.items[index] = item;
    changeTicketTotalSalaryAndTotalDiscount();
    emit(EditItemTicketSalesStates());
  }

  deleteItemFromTicket(int index) {
    ticketModel.items.removeAt(index);
    changeTicketTotalSalaryAndTotalDiscount();
    emit(DeleteItemFromTicketSalesStates());
  }

  changeTicketType(String type) {
    ticketModel.ticketType = type;
    emit(ChangeTicketTypeSalesStates());
  }

  //###############################DISCOUNT#################################
  //#################CHANGE SALARY OF TICKET AND TOTAL DISCOUNT ############

  // 3 states of discount
  // 1 ===> when add discount before add items to ticket ====>  calculate only variables of discount % or value
  // 2 ===> in add edit delete item ====> total salary & totalDiscount changes ( variables of discount % or value  not need to change)
  // 3 ===> in add delete discount and found items in ticket  ====> total salary & totalDiscount & variables of discount % or value changes

  // CALL IN ADD EDIT DELETE ITEM FROM TICKET
  changeTicketTotalSalaryAndTotalDiscount() {
    // get new total
    refreshTotalInTicket();
    setNewTotalSalaryAndTotalDiscount();
  }

  addNewDiscount(DiscountModel discount) {
    ticketModel.discountList.add(discount);
    changeDiscountVariablesInTicket();
    refreshTotalInTicket();
    setNewTotalSalaryAndTotalDiscount();
  }

  bool checkDiscountIsAvailable(DiscountModel discount) {
    return ticketModel.discountList.contains(discount);
  }

  changeDiscountListInTicket(List<DiscountModel> newDiscountList) {
    ticketModel.discountList = newDiscountList;
    changeDiscountVariablesInTicket();
    refreshTotalInTicket();
    setNewTotalSalaryAndTotalDiscount();
    emit(ChangeInDiscountListInTicketState());
  }

  refreshTotalInTicket() {
    if (ticketModel.items.isNotEmpty) {
      num total = 0;
      for (var s in ticketModel.items) {
        total += s.total ?? 0.0;
      }
      ticketModel.total = num.tryParse(total.toStringAsFixed(2));
    } else {
      ticketModel.total = null;
    }
  }

  changeDiscountVariablesInTicket() {
    totalDiscountPercentage = 0.0;
    totalDiscountValue = 0.0;
    for (var element in ticketModel.discountList) {
      if (element.isPercentage == true) {
        totalDiscountPercentage += ((element.value)! / 100.0);
      } else {
        totalDiscountValue += (element.value)!;
      }
    }
  }

  setNewTotalSalaryAndTotalDiscount() {
    if (ticketModel.total != null) {
      ticketModel.totalDiscount = num.tryParse(
          ((totalDiscountPercentage * ticketModel.total!) + totalDiscountValue)
              .toStringAsFixed(2));
      ticketModel.total = num.tryParse(
          (ticketModel.total! - ticketModel.totalDiscount!).toStringAsFixed(2));
    } else {
      ticketModel.totalDiscount = null;
    }
    emit(ChangeInDiscountListInTicketState());
  }
}

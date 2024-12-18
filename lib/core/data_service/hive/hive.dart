import 'package:e_ticket_app/core/constant/constant.dart';
import 'package:e_ticket_app/modules/auth/domain/model/user_model.dart';
import 'package:e_ticket_app/modules/home%20sales/sales/domain/model/ticket_model.dart';
import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HiveService {
  static Future hiveInit() async {
    await Hive.initFlutter();
    // last HiveType  ===> 5
    Hive.registerAdapter(TicketModelAdapter());
    Hive.registerAdapter(ItemModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(CompanyDataModelAdapter());
    Hive.registerAdapter(CompanyModelAdapter());
    Hive.registerAdapter(DiscountModelAdapter());
    await Hive.openBox<TicketModel>(kOpenTicketBox);
    await Hive.openBox<UserModel>(kUserModel);
    await Hive.openBox<DiscountModel>(kDiscountBox);
    await Hive.openBox<ItemModel>(kFavoriteBox);
  }
  /////////////////////USERMODEL////////////////////////////

  static Future saveUserModel(UserModel userModel) async {
    final box = Hive.box<UserModel>(kUserModel);
    await box.put(0, userModel);
  }

  static UserModel getUserModelData() {
    final box = Hive.box<UserModel>(kUserModel);
    if (box.isNotEmpty) {
      return box.values.first;
    } else {
      return UserModel();
    }
  }

  static Future deleteUserModel() async {
    final box = Hive.box<UserModel>(kUserModel);
    await box.delete(0);
  }

  static String? getUserToken() {
    final box = Hive.box<UserModel>(kUserModel);
    if (box.isNotEmpty) {
      return box.values.first.token;
    } else {
      return null;
    }
  }

  /////////////////////////TICKETS////////////////////////////////////////
  static Future addTicketToDB(TicketModel ticketModel) async {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    await box.put(ticketModel.uuid, ticketModel);
  }

  static bool checkEmptyTicketListDB() {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    if (box.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static List<TicketModel> getTicketListDB() {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    if (box.isNotEmpty) {
      return box.values.toList();
    } else {
      return <TicketModel>[];
    }
  }

  static Future clearTicketList(List<String> keyList) async {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    await box.deleteAll(keyList);
  }

  static updateTicket(TicketModel ticketModel) async {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    await box.put(ticketModel.uuid, ticketModel);
  }

  /// use in split ticket
  static updateTicketList(List<TicketModel> ticketModelList) {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    ticketModelList.forEach((ticketModel) async {
      await box.put(ticketModel.uuid, ticketModel);
    });
  }

  static Future clearTicket(String key) async {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    await box.delete(key);
  }

  static clearBox() {
    final box = Hive.box<TicketModel>(kOpenTicketBox);
    box.clear();
  }

  /////////////////////Discount //////////////////

  static List<DiscountModel> getDiscountList() {
    final box = Hive.box<DiscountModel>(kDiscountBox);
    if (box.isNotEmpty) {
      return box.values.toList();
    } else {
      return [];
    }
  }

  static Future addDiscountToDB(DiscountModel discountModel) async {
    final box = Hive.box<DiscountModel>(kDiscountBox);
    await box.put(discountModel.uuid, discountModel);
  }

  static Future clearDiscountList(List<String> keyList) async {
    final box = Hive.box<DiscountModel>(kDiscountBox);
    await box.deleteAll(keyList);
  }

  ///////////////////////////Favorite///////////////////////////////

  static List<ItemModel> getFavoriteList() {
    final box = Hive.box<ItemModel>(kFavoriteBox);
    if (box.isNotEmpty) {
      return box.values.toList();
    } else {
      return [];
    }
  }

  static Future addFavoriteToDB(List<ItemModel> favList) async {
    final box = Hive.box<ItemModel>(kFavoriteBox);
    favList.forEach((favItem) async {
      await box.add(favItem);
    });
  }

  static Future clearFavoriteItemsFromDB() async {
    final box = Hive.box<ItemModel>(kFavoriteBox);
    await box.clear();
  } 
  
  //////////////////////////////////////////
}

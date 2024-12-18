import 'package:e_ticket_app/modules/sales%20items/domain/model/discount_model.dart';
import 'package:e_ticket_app/shared/models/item_model.dart';
import 'package:hive/hive.dart';
part 'ticket_model.g.dart';

@HiveType(typeId: 0)
class TicketModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  num? salary;
  @HiveField(2)
  String? customerName;
  @HiveField(3)
  DateTime? dataTime;
  @HiveField(4)
  num? total;
  @HiveField(5)
  List<ItemModel> items;
  @HiveField(6)
  String? employeeName;
  @HiveField(7)
  String? ticketType;
  @HiveField(8)
  String? amountTime; 


  ////Additional for app
  @HiveField(9)
  String? uuid; // for id to ticket in open ticket 
  @HiveField(10)
  bool? isSelected; // easy way to manage select ticket in ui
  @HiveField(11)
  List<DiscountModel> discountList ; 
  @HiveField(12) 
  num? totalDiscount ; 


  TicketModel(
      {this.name,
      this.salary,
      this.customerName,
      this.items = const <ItemModel>[],
      this.total,
      this.employeeName,
      this.ticketType,
      this.amountTime,
      this.uuid,
      this.isSelected,
      this.dataTime , 
      this.discountList = const <DiscountModel>[] , 
      this.totalDiscount 
      
      });

  TicketModel.copy(TicketModel other)
      : name = other.name,
        items = List.from(other.items),
        customerName = other.customerName,
        employeeName = other.employeeName,
        salary = other.salary, 
        ticketType = other.ticketType,
        amountTime = other.amountTime,
        uuid = other.uuid,
        isSelected = other.isSelected,
        dataTime = other.dataTime,
        discountList = other.discountList , 
        totalDiscount = other.totalDiscount , 
        total = other.total;

  TicketModel copy() {
    return TicketModel.copy(this);
  }
}

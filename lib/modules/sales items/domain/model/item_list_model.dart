import 'package:e_ticket_app/shared/models/item_model.dart';

class ItemListModel {

  List<ItemModel>? itemList = <ItemModel>[];

  ItemListModel({this.itemList});

  ItemListModel.fromJson(List json) {
    if (json.isNotEmpty) {
      for (var element in json) {
        itemList?.add(ItemModel.fromJson(element));
      }
    }
  }
}

// class ItemModel {
//   int? id;
//   String? nameAr;
//   String? nameEn;
//   String? unitCost;
//   Null? vatPercent;
//   Null? nofPieces;
//   Null? pieceWeight;
//   int? pieceMeasurunit;
//   String? image;
//   Null? description;
//   int? unitNo;
//   String? unitNmAr;
//   String? unitNmEn;
//   int? requestLimit;
//   int? maxSales;
//   double? price;
//   double? minPrice;
//   int? minOrderQty;
//   double? lateenPrice;
//   int? lateenVat;
//   double? itemPrice;
//   int? vat;
//   double? priceVat;
//   Null? fctryBarcode;
//   String? storeNo;
//   String? storeName;
//   String? storeBalance;
//   int? measureGrp;
//   bool? hasRelationals;
//   List<Null>? relationals;

//   ItemModel(
//       {this.id,
//       this.nameAr,
//       this.nameEn,
//       this.unitCost,
//       this.vatPercent,
//       this.nofPieces,
//       this.pieceWeight,
//       this.pieceMeasurunit,
//       this.image,
//       this.description,
//       this.unitNo,
//       this.unitNmAr,
//       this.unitNmEn,
//       this.requestLimit,
//       this.maxSales,
//       this.price,
//       this.minPrice,
//       this.minOrderQty,
//       this.lateenPrice,
//       this.lateenVat,
//       this.itemPrice,
//       this.vat,
//       this.priceVat,
//       this.fctryBarcode,
//       this.storeNo,
//       this.storeName,
//       this.storeBalance,
//       this.measureGrp,
//       this.hasRelationals,
//       this.relationals});

//   ItemModel.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     nameAr = json['NameAr'];
//     nameEn = json['NameEn'];
//     unitCost = json['Unit_Cost'];
//     vatPercent = json['Vat_Percent'];
//     nofPieces = json['Nof_Pieces'];
//     pieceWeight = json['Piece_weight'];
//     pieceMeasurunit = json['Piece_measurunit'];
//     image = json['Image'];
//     description = json['Description'];
//     unitNo = json['Unit_No'];
//     unitNmAr = json['UnitNmAr'];
//     unitNmEn = json['UnitNmEn'];
//     requestLimit = json['Request_limit'];
//     maxSales = json['Max_Sales'];
//     price = json['Price'];
//     minPrice = json['MinPrice'];
//     minOrderQty = json['MinOrder_Qty'];
//     lateenPrice = json['Lateen_Price'];
//     lateenVat = json['Lateen_Vat'];
//     itemPrice = json['Item_Price'];
//     vat = json['Vat'];
//     priceVat = json['priceVat'];
//     fctryBarcode = json['Fctry_Barcode'];
//     storeNo = json['store_no'];
//     storeName = json['store_name'];
//     storeBalance = json['storeBalance'];
//     measureGrp = json['Measure_Grp'];
//     hasRelationals = json['hasRelationals'];
//     if (json['relationals'] != null) {
//       relationals = <Null>[];
//       json['relationals'].forEach((v) {
//         relationals!.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Id'] = this.id;
//     data['NameAr'] = this.nameAr;
//     data['NameEn'] = this.nameEn;
//     data['Unit_Cost'] = this.unitCost;
//     data['Vat_Percent'] = this.vatPercent;
//     data['Nof_Pieces'] = this.nofPieces;
//     data['Piece_weight'] = this.pieceWeight;
//     data['Piece_measurunit'] = this.pieceMeasurunit;
//     data['Image'] = this.image;
//     data['Description'] = this.description;
//     data['Unit_No'] = this.unitNo;
//     data['UnitNmAr'] = this.unitNmAr;
//     data['UnitNmEn'] = this.unitNmEn;
//     data['Request_limit'] = this.requestLimit;
//     data['Max_Sales'] = this.maxSales;
//     data['Price'] = this.price;
//     data['MinPrice'] = this.minPrice;
//     data['MinOrder_Qty'] = this.minOrderQty;
//     data['Lateen_Price'] = this.lateenPrice;
//     data['Lateen_Vat'] = this.lateenVat;
//     data['Item_Price'] = this.itemPrice;
//     data['Vat'] = this.vat;
//     data['priceVat'] = this.priceVat;
//     data['Fctry_Barcode'] = this.fctryBarcode;
//     data['store_no'] = this.storeNo;
//     data['store_name'] = this.storeName;
//     data['storeBalance'] = this.storeBalance;
//     data['Measure_Grp'] = this.measureGrp;
//     data['hasRelationals'] = this.hasRelationals;
//     if (this.relationals != null) {
//       data['relationals'] = this.relationals!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

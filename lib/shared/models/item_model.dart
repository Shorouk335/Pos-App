import 'package:hive/hive.dart';
part 'item_model.g.dart';

@HiveType(typeId: 1)
class ItemModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  num? salary;
  @HiveField(2)
  int? count;
  @HiveField(3)
  num? total; 
  @HiveField(8)
  
  int? id;
  String? nameAr;
  // String? nameEn;
  String? unitCost;
  dynamic vatPercent;
  dynamic nofPieces;
  dynamic pieceWeight;
  int? pieceMeasurunit;
  String? image;
  dynamic description;
  int? unitNo;
  String? unitNmAr;
  String? unitNmEn;
  int? requestLimit;
  int? maxSales;
  double? price;
  double? minPrice;
  int? minOrderQty;
  double? lateenPrice;
  int? lateenVat;
  double? itemPrice;
  int? vat;
  double? priceVat;
  dynamic fctryBarcode;
  String? storeNo;
  String? storeName;
  String? storeBalance;
  int? measureGrp;
  bool? hasRelationals;
  // List<dynamic>? relationals;

  /// help in app
  @HiveField(4)
  bool? isSaved;
  @HiveField(5)
  bool? isSelected;
  @HiveField(6)
  String? shape;
  @HiveField(7)
  int? color;

  ItemModel({
    this.name,
    this.salary,
    this.total,
    this.count,
    this.isSaved,
    this.isSelected,
    this.color,
    this.shape,
    this.hasRelationals,
    this.description,
    this.fctryBarcode,
    this.id,
    this.image,
    this.itemPrice,
    this.lateenPrice,
    this.lateenVat,
    this.maxSales,
    this.measureGrp,
    this.minOrderQty,
    this.minPrice,
    this.nameAr,
    // this.nameEn,
    this.nofPieces,
    this.pieceMeasurunit,
    this.vatPercent,
    this.pieceWeight,
    this.price,
    this.priceVat,
    // this.relationals,
    this.requestLimit,
    this.storeBalance,
    this.storeName,
    this.storeNo,
    this.unitCost,
    this.unitNmAr,
    this.unitNmEn,
    this.unitNo,
    this.vat,
  });

  ItemModel.copy(ItemModel other) 
      : name = other.name,
        salary = other.salary,
        count = other.count,
        isSaved = other.isSaved,
        isSelected = other.isSelected,
        total = other.total,
        color = other.color,
        shape = other.shape,
        description = other.description,
        hasRelationals = other.hasRelationals,
        fctryBarcode = other.fctryBarcode,
        id = other.id,
        image = other.image,
        itemPrice = other.itemPrice,
        lateenPrice = other.lateenPrice,
        lateenVat = other.lateenVat,
        maxSales = other.maxSales,
        measureGrp = other.measureGrp,
        minOrderQty = other.minOrderQty,
        minPrice = other.minPrice,
        vatPercent = other.vatPercent,
        nameAr = other.nameAr,
        // nameEn = other.nameEn,
        nofPieces = other.nofPieces,
        pieceMeasurunit = other.pieceMeasurunit,
        pieceWeight = other.pieceWeight,
        price = other.price,
        priceVat = other.priceVat,
        // relationals = other.relationals,
        requestLimit = other.requestLimit,
        storeBalance = other.storeBalance,
        storeName = other.storeName,
        storeNo = other.storeNo,
        unitCost = other.unitCost,
        unitNmAr = other.unitNmAr,
        unitNmEn = other.unitNmEn,
        unitNo = other.unitNo,
        vat = other.vat;

  ItemModel copy() {
    return ItemModel.copy(this);
  }

 
  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nameAr = json['NameAr'];
    name = json['NameEn'];
    unitCost = json['Unit_Cost'];
    vatPercent = json['Vat_Percent'];
    nofPieces = json['Nof_Pieces'];
    pieceWeight = json['Piece_weight'];
    pieceMeasurunit = json['Piece_measurunit'];
    image = json['Image'];
    description = json['Description'];
    unitNo = json['Unit_No'];
    unitNmAr = json['UnitNmAr'];
    unitNmEn = json['UnitNmEn'];
    requestLimit = json['Request_limit'];
    maxSales = json['Max_Sales'];
    price = json['Price'];
    minPrice = json['MinPrice'];
    minOrderQty = json['MinOrder_Qty'];
    lateenPrice = json['Lateen_Price'];
    lateenVat = json['Lateen_Vat'];
    itemPrice = json['Item_Price'];
    vat = json['Vat'];
    priceVat = json['priceVat'];
    fctryBarcode = json['Fctry_Barcode'];
    storeNo = json['store_no'];
    storeName = json['store_name'];
    storeBalance = json['storeBalance'];
    measureGrp = json['Measure_Grp'];
    hasRelationals = json['hasRelationals'];
    // if (json['relationals'] != null) {
    //   relationals = <dynamic>[];
    //   // json['relationals'].forEach((v) {
    //   //   relationals!.add(new Null.fromJson(v));
    //   // });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['NameAr'] = nameAr;
    data['NameEn'] = name;
    data['Unit_Cost'] = unitCost;
    data['Vat_Percent'] = vatPercent;
    data['Nof_Pieces'] = nofPieces;
    data['Piece_weight'] = pieceWeight;
    data['Piece_measurunit'] = pieceMeasurunit;
    data['Image'] = image;
    data['Description'] = description;
    data['Unit_No'] = unitNo;
    data['UnitNmAr'] = unitNmAr;
    data['UnitNmEn'] = unitNmEn;
    data['Request_limit'] = requestLimit;
    data['Max_Sales'] = maxSales;
    data['Price'] = price;
    data['MinPrice'] = minPrice;
    data['MinOrder_Qty'] = minOrderQty;
    data['Lateen_Price'] = lateenPrice;
    data['Lateen_Vat'] = lateenVat;
    data['Item_Price'] = itemPrice;
    data['Vat'] = vat;
    data['priceVat'] = priceVat;
    data['Fctry_Barcode'] = fctryBarcode;
    data['store_no'] = storeNo;
    data['store_name'] = storeName;
    data['storeBalance'] = storeBalance;
    data['Measure_Grp'] = measureGrp;
    data['hasRelationals'] = hasRelationals;
    // if (relationals != null) {
    //   data['relationals'] = relationals!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

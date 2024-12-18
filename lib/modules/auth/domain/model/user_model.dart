import 'package:hive_flutter/adapters.dart';

part "user_model.g.dart";

@HiveType(typeId: 2)
class UserModel extends HiveObject {
  @HiveField(0)
  String? status;
  @HiveField(1)
  String? message;
  @HiveField(2)
  CompanyDataModel? companyDataModel;
  @HiveField(3)
  String? token;
  @HiveField(4)
  String? username;
  @HiveField(5)
  int? id;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? role;
  @HiveField(8)
  int? cmpId;
  @HiveField(9)
  int? cmpNo;
  @HiveField(10)
  String? name;
  @HiveField(11)
  String? logo;
  @HiveField(12)
  String? taxNo;
  @HiveField(13)
  String? cRNo;
  @HiveField(14)
  int? taxExtraPrct;
  @HiveField(15)
  bool? allowNegative;

  UserModel(
      {this.status,
      this.message,
      this.companyDataModel,
      this.token,
      this.username,
      this.id,
      this.email,
      this.role,
      this.cmpId,
      this.cmpNo,
      this.name,
      this.logo,
      this.taxNo,
      this.cRNo,
      this.taxExtraPrct,
      this.allowNegative});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    companyDataModel =
        json['data'] != null ? CompanyDataModel.fromJson(json['data']) : null;
    token = json['token'];
    username = json['username'];
    id = json['id'];
    email = json['email'];
    role = json['role'];
    cmpId = json['cmpId'];
    cmpNo = json['cmpNo'];
    name = json['name'];
    logo = json['logo'];
    taxNo = json['Tax_No'];
    cRNo = json['CR_No'];
    taxExtraPrct = json['TaxExtra_Prct'];
    allowNegative = json['allow_negative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (companyDataModel != null) {
      data['data'] = companyDataModel!.toJson();
    }
    data['token'] = token;
    data['username'] = username;
    data['id'] = id;
    data['email'] = email;
    data['role'] = role;
    data['cmpId'] = cmpId;
    data['cmpNo'] = cmpNo;
    data['name'] = name;
    data['logo'] = logo;
    data['Tax_No'] = taxNo;
    data['CR_No'] = cRNo;
    data['TaxExtra_Prct'] = taxExtraPrct;
    data['allow_negative'] = allowNegative;
    return data;
  }
}
@HiveType(typeId: 3)
class CompanyDataModel extends HiveObject{
    @HiveField(0)
  List<CompanyModel>? companies;
    @HiveField(1)
  dynamic currentCompany;
    @HiveField(2)
  bool? shouldVerify;

  CompanyDataModel({this.companies, this.currentCompany, this.shouldVerify});

  CompanyDataModel.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = <CompanyModel>[];
      json['companies'].forEach((v) {
        companies!.add(CompanyModel.fromJson(v));
      });
    }
    currentCompany = json['currentCompany'];
    shouldVerify = json['should_verify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (companies != null) {
      data['companies'] = companies!.map((v) => v.toJson()).toList();
    }
    data['currentCompany'] = currentCompany;
    data['should_verify'] = shouldVerify;
    return data;
  }
}
@HiveType(typeId: 4)
class CompanyModel {
    @HiveField(0)
  String? name;
    @HiveField(1)
  int? id;

  CompanyModel({this.name, this.id});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

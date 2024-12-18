// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 2;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      status: fields[0] as String?,
      message: fields[1] as String?,
      companyDataModel: fields[2] as CompanyDataModel?,
      token: fields[3] as String?,
      username: fields[4] as String?,
      id: fields[5] as int?,
      email: fields[6] as String?,
      role: fields[7] as String?,
      cmpId: fields[8] as int?,
      cmpNo: fields[9] as int?,
      name: fields[10] as String?,
      logo: fields[11] as String?,
      taxNo: fields[12] as String?,
      cRNo: fields[13] as String?,
      taxExtraPrct: fields[14] as int?,
      allowNegative: fields[15] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.companyDataModel)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.role)
      ..writeByte(8)
      ..write(obj.cmpId)
      ..writeByte(9)
      ..write(obj.cmpNo)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.logo)
      ..writeByte(12)
      ..write(obj.taxNo)
      ..writeByte(13)
      ..write(obj.cRNo)
      ..writeByte(14)
      ..write(obj.taxExtraPrct)
      ..writeByte(15)
      ..write(obj.allowNegative);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyDataModelAdapter extends TypeAdapter<CompanyDataModel> {
  @override
  final int typeId = 3;

  @override
  CompanyDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyDataModel(
      companies: (fields[0] as List?)?.cast<CompanyModel>(),
      currentCompany: fields[1] as dynamic,
      shouldVerify: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.companies)
      ..writeByte(1)
      ..write(obj.currentCompany)
      ..writeByte(2)
      ..write(obj.shouldVerify);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyModelAdapter extends TypeAdapter<CompanyModel> {
  @override
  final int typeId = 4;

  @override
  CompanyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyModel(
      name: fields[0] as String?,
      id: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

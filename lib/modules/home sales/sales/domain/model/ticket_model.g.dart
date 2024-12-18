// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TicketModelAdapter extends TypeAdapter<TicketModel> {
  @override
  final int typeId = 0;

  @override
  TicketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TicketModel(
      name: fields[0] as String?,
      salary: fields[1] as num?,
      customerName: fields[2] as String?,
      items: (fields[5] as List).cast<ItemModel>(),
      total: fields[4] as num?,
      employeeName: fields[6] as String?,
      ticketType: fields[7] as String?,
      amountTime: fields[8] as String?,
      uuid: fields[9] as String?,
      isSelected: fields[10] as bool?,
      dataTime: fields[3] as DateTime?,
      discountList: (fields[11] as List).cast<DiscountModel>(),
      totalDiscount: fields[12] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, TicketModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.salary)
      ..writeByte(2)
      ..write(obj.customerName)
      ..writeByte(3)
      ..write(obj.dataTime)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.items)
      ..writeByte(6)
      ..write(obj.employeeName)
      ..writeByte(7)
      ..write(obj.ticketType)
      ..writeByte(8)
      ..write(obj.amountTime)
      ..writeByte(9)
      ..write(obj.uuid)
      ..writeByte(10)
      ..write(obj.isSelected)
      ..writeByte(11)
      ..write(obj.discountList)
      ..writeByte(12)
      ..write(obj.totalDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

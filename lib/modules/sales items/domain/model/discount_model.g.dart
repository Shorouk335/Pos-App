// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscountModelAdapter extends TypeAdapter<DiscountModel> {
  @override
  final int typeId = 5;

  @override
  DiscountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscountModel(
      name: fields[0] as String?,
      isSelected: fields[2] as bool?,
      isPercentage: fields[3] as bool?,
      value: fields[1] as double?,
      uuid: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DiscountModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.isSelected)
      ..writeByte(3)
      ..write(obj.isPercentage)
      ..writeByte(4)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

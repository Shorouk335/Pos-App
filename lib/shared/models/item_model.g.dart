// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 1;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      name: fields[0] as String?,
      salary: fields[1] as num?,
      total: fields[3] as num?,
      count: fields[2] as int?,
      isSaved: fields[4] as bool?,
      isSelected: fields[5] as bool?,
      color: fields[7] as int?,
      shape: fields[6] as String?,
      id: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.salary)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.isSaved)
      ..writeByte(5)
      ..write(obj.isSelected)
      ..writeByte(6)
      ..write(obj.shape)
      ..writeByte(7)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

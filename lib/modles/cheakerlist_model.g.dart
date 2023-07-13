// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheakerlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class listmodelAdapter extends TypeAdapter<listmodel> {
  @override
  final int typeId = 0;

  @override
  listmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return listmodel(
      item: fields[0] as String,
      cheak: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, listmodel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.cheak);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is listmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

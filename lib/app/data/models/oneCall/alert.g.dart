// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlertAdapter extends TypeAdapter<Alert> {
  @override
  final int typeId = 7;

  @override
  Alert read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alert(
      senderName: fields[0] as String?,
      event: fields[1] as String?,
      start: fields[2] as int?,
      end: fields[3] as int?,
      description: fields[4] as String?,
      tags: (fields[5] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Alert obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.senderName)
      ..writeByte(1)
      ..write(obj.event)
      ..writeByte(2)
      ..write(obj.start)
      ..writeByte(3)
      ..write(obj.end)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

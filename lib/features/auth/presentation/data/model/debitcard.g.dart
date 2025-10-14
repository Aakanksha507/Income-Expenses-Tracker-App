// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debitcard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebitCardAdapter extends TypeAdapter<DebitCard> {
  @override
  final int typeId = 2;

  @override
  DebitCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebitCard(
      userId: fields[0] as String,
      cardName: fields[1] as String,
      cardNumber: fields[2] as String,
      cvc: fields[3] as String,
      date: fields[4] as String,
      zip: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DebitCard obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.cardName)
      ..writeByte(2)
      ..write(obj.cardNumber)
      ..writeByte(3)
      ..write(obj.cvc)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.zip);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebitCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

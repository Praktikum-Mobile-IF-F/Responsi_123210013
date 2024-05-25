// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KopisAdapter extends TypeAdapter<Kopis> {
  @override
  final int typeId = 0;

  @override
  Kopis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Kopis(
      name: fields[0] as String,
      price: fields[1] as String,
      region: fields[2] as String,
      flavorProfile: (fields[3] as List).cast<String>(),
      grindOption: (fields[4] as List).cast<String>(),
      roastLevel: fields[5] as String,
      imageUrl: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Kopis obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.region)
      ..writeByte(3)
      ..write(obj.flavorProfile)
      ..writeByte(4)
      ..write(obj.grindOption)
      ..writeByte(5)
      ..write(obj.roastLevel)
      ..writeByte(6)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KopisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

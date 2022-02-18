// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'hiveModel.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class HiveModelAdapter extends TypeAdapter<HiveModel> {
//   @override
//   final int typeId = 0;

//   @override
//   HiveModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return HiveModel()
//       ..name = fields[0] as String
//       ..lastname = fields[1] as String
//       ..isExpense = fields[2] as bool
//       ..amount = fields[3] as double;
//   }

//   @override
//   void write(BinaryWriter writer, HiveModel obj) {
//     writer
//       ..writeByte(4)
//       ..writeByte(0)
//       ..write(obj.name)
//       ..writeByte(1)
//       ..write(obj.lastname)
//       ..writeByte(2)
//       ..write(obj.isExpense)
//       ..writeByte(3)
//       ..write(obj.amount);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is HiveModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

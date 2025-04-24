// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormatsAdapter extends TypeAdapter<Formats> {
  @override
  final int typeId = 2;

  @override
  Formats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Formats(
      textHtml: fields[0] as String?,
      applicationEpubZip: fields[1] as String?,
      applicationXMobipocketEbook: fields[2] as String?,
      applicationRdfXml: fields[3] as String?,
      imageJpeg: fields[4] as String?,
      textPlainCharsetUsAscii: fields[5] as String?,
      applicationOctetStream: fields[6] as String?,
      textPlainCharsetUtf8: fields[7] as String?,
      textHtmlCharsetUtf8: fields[8] as String?,
      textPlainCharsetIso88591: fields[9] as String?,
      textHtmlCharsetIso88591: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Formats obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.textHtml)
      ..writeByte(1)
      ..write(obj.applicationEpubZip)
      ..writeByte(2)
      ..write(obj.applicationXMobipocketEbook)
      ..writeByte(3)
      ..write(obj.applicationRdfXml)
      ..writeByte(4)
      ..write(obj.imageJpeg)
      ..writeByte(5)
      ..write(obj.textPlainCharsetUsAscii)
      ..writeByte(6)
      ..write(obj.applicationOctetStream)
      ..writeByte(7)
      ..write(obj.textPlainCharsetUtf8)
      ..writeByte(8)
      ..write(obj.textHtmlCharsetUtf8)
      ..writeByte(9)
      ..write(obj.textPlainCharsetIso88591)
      ..writeByte(10)
      ..write(obj.textHtmlCharsetIso88591);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

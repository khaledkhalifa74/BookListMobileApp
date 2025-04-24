import 'package:hive/hive.dart';
part 'formats.g.dart';

@HiveType(typeId: 2)
class Formats {
  @HiveField(0)
  String? textHtml;

  @HiveField(1)
  String? applicationEpubZip;

  @HiveField(2)
  String? applicationXMobipocketEbook;

  @HiveField(3)
  String? applicationRdfXml;

  @HiveField(4)
  String? imageJpeg;

  @HiveField(5)
  String? textPlainCharsetUsAscii;

  @HiveField(6)
  String? applicationOctetStream;

  @HiveField(7)
  String? textPlainCharsetUtf8;

  @HiveField(8)
  String? textHtmlCharsetUtf8;

  @HiveField(9)
  String? textPlainCharsetIso88591;

  @HiveField(10)
  String? textHtmlCharsetIso88591;

  Formats({
    this.textHtml,
    this.applicationEpubZip,
    this.applicationXMobipocketEbook,
    this.applicationRdfXml,
    this.imageJpeg,
    this.textPlainCharsetUsAscii,
    this.applicationOctetStream,
    this.textPlainCharsetUtf8,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetIso88591,
    this.textHtmlCharsetIso88591,
  });

  factory Formats.fromJson(Map<String, dynamic> json) {
    return Formats(
      textHtml: json['text/html'],
      applicationEpubZip: json['application/epub+zip'],
      applicationXMobipocketEbook: json['application/x-mobipocket-ebook'],
      applicationRdfXml: json['application/rdf+xml'],
      imageJpeg: json['image/jpeg'],
      textPlainCharsetUsAscii: json['text/plain; charset=us-ascii'],
      applicationOctetStream: json['application/octet-stream'],
      textPlainCharsetUtf8: json['text/plain; charset=utf-8'],
      textHtmlCharsetUtf8: json['text/html; charset=utf-8'],
      textPlainCharsetIso88591: json['text/plain; charset=iso-8859-1'],
      textHtmlCharsetIso88591: json['text/html; charset=iso-8859-1'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text/html': textHtml,
      'application/epub+zip': applicationEpubZip,
      'application/x-mobipocket-ebook': applicationXMobipocketEbook,
      'application/rdf+xml': applicationRdfXml,
      'image/jpeg': imageJpeg,
      'text/plain; charset=us-ascii': textPlainCharsetUsAscii,
      'application/octet-stream': applicationOctetStream,
      'text/plain; charset=utf-8': textPlainCharsetUtf8,
      'text/html; charset=utf-8': textHtmlCharsetUtf8,
      'text/plain; charset=iso-8859-1': textPlainCharsetIso88591,
      'text/html; charset=iso-8859-1': textHtmlCharsetIso88591,
    };
  }
}

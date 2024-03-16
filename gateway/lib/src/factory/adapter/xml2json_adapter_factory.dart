import 'package:gateway/src/adapter/xml_parser/protocol/xml_parser_adapter.dart';
import 'package:gateway/src/adapter/xml_parser/xml2json_adapter.dart';

class Xml2JsonAdapterFactory {
  static XmlParserAdapter make() {
    return Xml2JsonAdapter();
  }
}
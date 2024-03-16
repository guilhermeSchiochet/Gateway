import 'dart:convert';
import 'package:gateway/src/adapter/xml_parser/protocol/xml_parser_adapter.dart';
import 'package:xml2json/xml2json.dart';

/// Classe responsável pela conversão de XML para JSON utilizando a biblioteca xml2json.
/// Implementa a interface XmlParserAdapter para fornecer uma abordagem padronizada para a conversão de XML para JSON.
class Xml2JsonAdapter implements XmlParserAdapter {
 /// Converte uma string XML em um Mapa (JSON) utilizando a convenção de transformação Parker.
 ///
 /// @param xml A string XML a ser convertida.
 /// @return Um Mapa representando o JSON resultante da conversão.
 @override
 Map parse(String xml) {
    final xmlTransformer = Xml2Json();
    xmlTransformer.parse(xml);
    return json.decode(xmlTransformer.toParker());
 }
}

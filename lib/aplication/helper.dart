import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

class Helper {
  static String publicApiKey = "fb20853a06c055ae96e97fc29f32d806";
  static String privateApiKey = "2844cf4e7f1f3d6e860c276a12879e60a63a33e4";
}

var url = "https://gateway.marvel.com/v1/public/";
var timeStamp = DateTime.now();
var hash = '';

String gerarUrl(String assunto,
    {String adicional = "", int limit = 100, int offset = 0}) {
  gerarHash();
  String urlFinal =
      "$url$assunto?apikey=${Helper.publicApiKey}&hash=$hash&limit=$limit&offset=$offset&ts=${timeStamp.toIso8601String()}$adicional";
  debugPrint('$urlFinal---------------gera url');

  return urlFinal;
}

gerarHash() {
  hash = generateMd5(
      timeStamp.toIso8601String() + Helper.privateApiKey + Helper.publicApiKey);
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

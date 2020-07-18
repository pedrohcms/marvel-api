import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:marvel_api/src/utils/Api.dart';

// TODO: Create a Api.dart file with a map called auth and put both your pulic key and private key there

class ApiService {
  String get baseUrl => 'https://gateway.marvel.com/v1/public';
  String get publicKey => auth['publicKey'];
  String get privateKey => auth['privateKey'];

  String makeHash() {
    String apiKey = DateTime.now().millisecondsSinceEpoch.toString() +
        privateKey +
        publicKey;

    return md5.convert(utf8.encode(apiKey)).toString();
  }

  Map<String, dynamic> makeQueryParams() {
    return {
      'apikey': this.publicKey,
      'ts': DateTime.now().millisecondsSinceEpoch.toString(),
      'hash': this.makeHash()
    };
  }
}

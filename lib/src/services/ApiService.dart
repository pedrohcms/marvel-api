import 'dart:convert';
import 'package:crypto/crypto.dart';

class ApiService {
  String get baseUrl => 'https://gateway.marvel.com/v1/public';
  String get publicKey => '81d6a976834e5a1c7c175ccaab687243';
  String get privateKey => '37acfec2598fbf433f4d093daa93c7c8974f27a1';

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

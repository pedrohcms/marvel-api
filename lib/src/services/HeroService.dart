import 'dart:convert';

import 'package:marvel_api/src/models/Hero.dart';
import 'package:marvel_api/src/services/ApiService.dart';
import 'package:dio/dio.dart';

class HeroService extends ApiService {
  final String resource = 'characters';

  Future<Hero> show(String heroName) async {
    String url = this.baseUrl + '/$resource';

    Map<String, dynamic> query = this.makeQueryParams();

    query['name'] = heroName;

    Hero hero;
    print(hero);

    try {
      Response response = await Dio().get(url, queryParameters: query);

      hero = Hero.fromJson(jsonDecode(response.toString()));

      return hero;
    } catch (e) {
      print(e);

      return hero;
    }
  }
}

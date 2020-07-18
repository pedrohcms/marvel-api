class Character {
  int id;
  String name;
  String description;
  String thumbnailUrl;
  int comics;
  String comicsUrl;
  int series;
  String seriesUrl;
  int stories;
  String storiesUrl;
  int events;
  String eventsUrl;

  Character();

  Character.fromJson(Map<String, dynamic> json) {
    this.id = json['data']['results'][0]['id'];

    this.name = json['data']['results'][0]['name'];

    this.description = json['data']['results'][0]['description'];

    this.thumbnailUrl = json['data']['results'][0]['thumbnail']['path'] +
        'portrait_fantastic' +
        json['data']['results'][0]['thumbnail']['extension'];

    this.comics = json['data']['results'][0]['comics']['available'];

    this.comicsUrl = json['data']['results'][0]['comics']['collectionURI'];

    this.series = json['data']['results'][0]['series']['available'];

    this.seriesUrl = json['data']['results'][0]['series']['collectionURI'];

    this.stories = json['data']['results'][0]['stories']['available'];

    this.storiesUrl = json['data']['results'][0]['stories']['collectionURI'];

    this.events = json['data']['results'][0]['events']['available'];

    this.eventsUrl = json['data']['results'][0]['events']['collectionURI'];
  }
}

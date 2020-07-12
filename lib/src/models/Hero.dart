class Hero {
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

  Hero(
      {this.id,
      this.name,
      this.description,
      this.thumbnailUrl,
      this.comics,
      this.comicsUrl,
      this.events,
      this.eventsUrl,
      this.series,
      this.seriesUrl,
      this.stories,
      this.storiesUrl});

  Hero.fromJson(Map<String, dynamic> json) {
    this.id = json['data']['results'][0]['id'];

    this.name = json['data']['results'][0]['name'];

    this.description = json['data']['results'][0]['description'];

    this.thumbnailUrl = json['data']['results'][0]['thumbnail']['path'] +
        'portrait_fantastic' +
        json['data']['results'][0]['thumbnail']['extension'];
    this.comics = json['data']['results'][0]['thumbnail']['comics']['avaible'];
    this.comicsUrl = json['data']['results'][0]['thumbnail']['comics']
        ['avaible']['collectionURI'];

    this.series = json['data']['results'][0]['thumbnail']['series']['avaible'];
    this.seriesUrl = json['data']['results'][0]['thumbnail']['series']
        ['avaible']['collectionURI'];

    this.stories =
        json['data']['results'][0]['thumbnail']['stories']['avaible'];
    this.storiesUrl = json['data']['results'][0]['thumbnail']['stories']
        ['avaible']['collectionURI'];

    this.events = json['data']['results'][0]['thumbnail']['events']['avaible'];
    this.eventsUrl = json['data']['results'][0]['thumbnail']['events']
        ['avaible']['collectionURI'];
  }
}

import 'common.dart';

class Event {
  int? id;
  String? title;
  String? description;
  String? resourceURI;
  List<Url>? urls;
  String? modified;
  String? start;
  String? end;
  Thumbnail? thumbnail;
  Type? creators;
  Type? characters;
  Type? stories;
  Type? comics;
  Type? series;
  Item? next;
  Item? previous;

  Event(
      {this.id,
      this.title,
      this.description,
      this.resourceURI,
      this.urls,
      this.modified,
      this.start,
      this.end,
      this.thumbnail,
      this.creators,
      this.characters,
      this.stories,
      this.comics,
      this.series,
      this.next,
      this.previous});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = <Url>[];
      json['urls'].forEach((v) {
        urls!.add(Url.fromJson(v));
      });
    }
    modified = json['modified'];
    start = json['start'];
    end = json['end'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    creators =
        json['creators'] != null ? Type.fromJson(json['creators']) : null;
    characters = json['characters'] != null
        ? Type.fromJson(json['characters'])
        : null;
    stories =
        json['stories'] != null ? Type.fromJson(json['stories']) : null;
    comics = json['comics'] != null ? Type.fromJson(json['comics']) : null;
    series = json['series'] != null ? Type.fromJson(json['series']) : null;
    next = json['next'] != null ? Item.fromJson(json['next']) : null;
    previous =
        json['previous'] != null ? Item.fromJson(json['previous']) : null;
  }
}

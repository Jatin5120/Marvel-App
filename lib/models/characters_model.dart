import 'common.dart';

class Character {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Type? comics;
  Type? series;
  Type? stories;
  Type? events;
  List<Url>? urls;

  Character({this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics =
    json['comics'] != null ? Type.fromJson(json['comics']) : null;
    series =
    json['series'] != null ? Type.fromJson(json['series']) : null;
    stories =
    json['stories'] != null ? Type.fromJson(json['stories']) : null;
    events =
    json['events'] != null ? Type.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = <Url>[];
      json['urls'].forEach((v) {
        urls!.add(Url.fromJson(v));
      });
    }
  }
}
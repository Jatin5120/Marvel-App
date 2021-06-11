import 'common.dart';

class Series {
  int? id;
  String? title;
  String? description;
  String? resourceURI;
  List<Url>? urls;
  int? startYear;
  int? endYear;
  String? rating;
  String? type;
  String? modified;
  Thumbnail? thumbnail;
  Type? creators;
  Type? characters;
  Type? stories;
  Type? comics;
  Type? events;
  Item? next;
  Null previous;

  Series(
      {this.id,
        this.title,
        this.description,
        this.resourceURI,
        this.urls,
        this.startYear,
        this.endYear,
        this.rating,
        this.type,
        this.modified,
        this.thumbnail,
        this.creators,
        this.characters,
        this.stories,
        this.comics,
        this.events,
        this.next,
        this.previous});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description']??'';
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls =  <Url>[];
      json['urls'].forEach((v) {
        urls!.add( Url.fromJson(v));
      });
    }
    startYear = json['startYear'];
    endYear = json['endYear'];
    rating = json['rating'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ?  Thumbnail.fromJson(json['thumbnail'])
        : null;
    creators = json['creators'] != null
        ?  Type.fromJson(json['creators'])
        : null;
    characters = json['characters'] != null
        ?  Type.fromJson(json['characters'])
        : null;
    stories =
    json['stories'] != null ?  Type.fromJson(json['stories']) : null;
    comics =
    json['comics'] != null ?  Type.fromJson(json['comics']) : null;
    events =
    json['events'] != null ?  Type.fromJson(json['events']) : null;
    next = json['next'] != null ?  Item.fromJson(json['next']) : null;
    previous = json['previous'];
  }
}

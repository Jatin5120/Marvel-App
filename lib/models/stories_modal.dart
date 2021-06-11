import 'common.dart';

class Story {
  int? id;
  String? title;
  String? description;
  String? resourceURI;
  String? type;
  String? modified;
  Thumbnail? thumbnail;
  Type? creators;
  Type? characters;
  Type? series;
  Type? comics;
  Type? events;
  Item? originalIssue;

  Story(
      {this.id,
      this.title,
      this.description,
      this.resourceURI,
      this.type,
      this.modified,
      this.thumbnail,
      this.creators,
      this.characters,
      this.series,
      this.comics,
      this.events,
      this.originalIssue});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = json['thumbnail'];
    creators =
        json['creators'] != null ? Type.fromJson(json['creators']) : null;
    characters =
        json['characters'] != null ? Type.fromJson(json['characters']) : null;
    series = json['series'] != null ? Type.fromJson(json['series']) : null;
    comics = json['comics'] != null ? Type.fromJson(json['comics']) : null;
    events = json['events'] != null ? Type.fromJson(json['events']) : null;
    originalIssue = json['originalIssue'] != null
        ? Item.fromJson(json['originalIssue'])
        : null;
  }
}

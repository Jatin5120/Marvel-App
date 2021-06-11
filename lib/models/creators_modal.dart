import 'common.dart';

class Creator {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? suffix;
  String? fullName;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  Type? comics;
  Type? series;
  Type? stories;
  Type? events;
  List<Url>? urls;

  Creator(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.suffix,
      this.fullName,
      this.modified,
      this.thumbnail,
      this.resourceURI,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    suffix = json['suffix'];
    fullName = json['fullName'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics = json['comics'] != null ? Type.fromJson(json['comics']) : null;
    series = json['series'] != null ? Type.fromJson(json['series']) : null;
    stories = json['stories'] != null ? Type.fromJson(json['stories']) : null;
    events = json['events'] != null ? Type.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = <Url>[];
      json['urls'].forEach((v) {
        urls!.add(Url.fromJson(v));
      });
    }
  }
}

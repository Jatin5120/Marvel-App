import 'common.dart';

class Comic {
  int? id;
  int? digitalId;
  String? title;
  dynamic issueNumber;    // Because some have int some have double
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List? textObjects;
  String? resourceURI;
  List<Url>? urls;
  Item? series;
  List<Item>? variants;
  List? collections;
  List? collectedIssues;
  List<Dates>? dates;
  List<Prices>? prices;
  Thumbnail? thumbnail;
  List? images;
  Type? creators;
  Type? characters;
  Type? stories;
  Type? events;

  Comic(
      {this.id,
      this.digitalId,
      this.title,
      this.issueNumber,
      this.variantDescription,
      this.description,
      this.modified,
      this.isbn,
      this.upc,
      this.diamondCode,
      this.ean,
      this.issn,
      this.format,
      this.pageCount,
      this.textObjects,
      this.resourceURI,
      this.urls,
      this.series,
      this.variants,
      this.collections,
      this.collectedIssues,
      this.dates,
      this.prices,
      this.thumbnail,
      this.images,
      this.creators,
      this.characters,
      this.stories,
      this.events});

  Comic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'];
    description = json['description']??'';
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    if (json['textObjects'] != null) {
      textObjects = [];
      json['textObjects'].forEach((v) {
        textObjects!.add(v);
      });
    }
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = <Url>[];
      json['urls'].forEach((v) {
        urls!.add(Url.fromJson(v));
      });
    }
    series = json['series'] != null ? Item.fromJson(json['series']) : null;
    if (json['variants'] != null) {
      variants = <Item>[];
      json['variants'].forEach((v) {
        variants!.add(Item.fromJson(v));
      });
    }
    if (json['collections'] != null) {
      collections = [];
      json['collections'].forEach((v) {
        collections!.add(v);
      });
    }
    if (json['collectedIssues'] != null) {
      collectedIssues = [];
      json['collectedIssues'].forEach((v) {
        collectedIssues!.add(v);
      });
    }
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(Dates.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(v);
      });
    }
    creators =
        json['creators'] != null ? Type.fromJson(json['creators']) : null;
    characters =
        json['characters'] != null ? Type.fromJson(json['characters']) : null;
    stories = json['stories'] != null ? Type.fromJson(json['stories']) : null;
    events = json['events'] != null ? Type.fromJson(json['events']) : null;
  }
}

class Dates {
  String? type;
  String? date;

  Dates({this.type, this.date});

  Dates.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'];
  }
}


class Prices {
  String? type;
  var price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
  }
}

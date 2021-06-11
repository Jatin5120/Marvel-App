class Type {
  int? available;
  String? collectionURI;
  List<Item>? items;
  int? returned;

  Type({this.available, this.collectionURI, this.items, this.returned});

  Type.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items =  <Item>[];
      json['items'].forEach((v) {
        items!.add( Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }
}

class Url {
  String? type;
  String? url;

  Url({this.type, this.url});

  Url.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }
}

class Item {
  String? resourceURI;
  String? name;

  Item({this.resourceURI, this.name});

  Item.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
}
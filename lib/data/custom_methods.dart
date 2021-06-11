import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/models/common.dart';

Future<Map<String, dynamic>?> fetchData(String? type) async {
  final String url = URL.getUrl(type: type, limit: 100);
  print(type);
  final http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print("Ok -> ${response.statusCode}");
  } else {
    print("Not ok -> ${response.statusCode}");
  }
  return jsonDecode(response.body);
}

Future<String> getIPAdress() async {
  final http.Response response =
      await http.get(Uri.parse('https://api.ipify.org'));
  return response.statusCode == 200 ? response.body : 'Not Found';
}

String convertImageUrl(Thumbnail? thumbnail) {
  if (thumbnail != null) {
    final String path =
        '${thumbnail.path!.substring(0, 4)}s${thumbnail.path!.substring(4)}';
    final String imageUrl = '$path.${thumbnail.extension}';
    return imageUrl;
  }
  return '';
}

bool checkIfImage(String imageUrl) =>
    imageUrl.endsWith('image_not_available.jpg');

/*
final String baseUrl = 'https://gateway.marvel.com:443/v1/public/';
  final String authority = 'https://gateway.marvel.com:443';
  final String path = '/v1/public/$type';
  final Map<String, dynamic> query = URL().getUrl(type: type, limit: 100);
  print(type);
  print(authority + path + query.toString());
  final http.Response response = await http.get(Uri.https(authority, path, query));
 */

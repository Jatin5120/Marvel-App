import 'package:crypto/crypto.dart';
import 'package:marvel_app/constants/constants.dart';

class URL {
  static const String baseUrl = 'https://gateway.marvel.com:443/v1/public/';

  static String getUrl({String? type, int? limit}) {
    String limitString;
    if (limit == null) {
      limitString = '';
    } else {
      limitString = 'limit=$limit&';
    }
    final DateTime timeStamp = DateTime.now();
    final String hashString =
        timeStamp.toString() + API.privateAPI + API.publicAPI;
    final Digest hash = md5.convert(hashString.codeUnits);
    final String url =
        '$baseUrl$type?${limitString}ts=$timeStamp&apikey=${API.publicAPI}&hash=$hash';
    return url;
  }
}

/*
Map<String, dynamic> getUrl({String type, int limit}) {
    Map<String, dynamic> query = Map<String, dynamic>();
    String url;
    String limitString;
    if (limit == null) {
      limitString = '';
    } else {
      limitString = '$limit&';
    }
    final DateTime timeStamp = DateTime.now();
    final String hashString = timeStamp.toString() + API.privateAPI + API.publicAPI;
    final Digest hash = md5.convert(hashString.codeUnits);
    final String queryValue = '${limitString}ts=$timeStamp&apikey=${API.publicAPI}&hash=$hash';
    query = {'limit': queryValue};
    print('Queries->$query');
    return query;
  }
 */

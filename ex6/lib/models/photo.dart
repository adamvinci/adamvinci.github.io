
 import 'dart:convert';
 import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class Photo{
  final int id;
  final String titre;
  final String thumbnail;
  final String ?urlPhoto;

  Photo(this.id, this.titre, this.thumbnail, this.urlPhoto);


  Photo.fromJson(Map<String, dynamic> jsonObj)
      : this(
   jsonObj["id"],
   jsonObj["title"],
     jsonObj["thumbnailUrl"],
   jsonObj["url"],
  );
  @override
  String toString() {
    return 'Photo{id: $id, titre: $titre, thumbnail: $thumbnail, urlPhoto: $urlPhoto}';
  }

  static const url = "https://unreal-api.azurewebsites.net/photos";
  static Future<List<Photo>> fetchPic() async {
   var response = await http.get(Uri.parse("$url"));

   if (response.statusCode != 200) {
    throw Exception("Error ${response.statusCode} fetching movies");
   }

   return compute((input) {
    final jsonList = jsonDecode(input);
    return jsonList.map<Photo>((jsonObj) => Photo.fromJson(jsonObj)).toList();
   }, response.body);
  }
}

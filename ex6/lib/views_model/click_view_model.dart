import 'dart:collection';


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/photo.dart';

class ClickViewModel extends ChangeNotifier {


  Future<UnmodifiableListView<Photo>> get items async {
    List<Photo>  _photos = await Photo.fetchPic();
     _photos.sort((a,b)=>b.id.compareTo(a.id));
      return UnmodifiableListView(_photos);

  }

    Future<void> add(String thumb,String title) async {
      var url = Uri.https('unreal-api.azurewebsites.net', '/photos');
      var response = await http.post(url, body: {'title': '${title}', 'thumbnailUrl': '${thumb}'});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    notifyListeners();
  }


}
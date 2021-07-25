import 'dart:convert';

import 'package:demo1/constants/strings.dart';
import 'package:demo1/models/movies_info.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Welcome> getMovies() async {
    var client=http.Client();
    var movieModel=null;


   try{
    var response = await client.get(Uri.parse(Strings.movie_url));
    if(response.statusCode==200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
       movieModel = Welcome.fromJson(jsonMap);    //factory copmponent of movies.info

    }
   }
   catch(Exception){
     return movieModel;
   }
    return movieModel;
  }
}
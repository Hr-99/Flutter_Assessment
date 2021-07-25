// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.search,
        this.totalResults,
        this.response,
    });

    List<Search> search;
    String totalResults;
    String response;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        search: List<Search>.from(json["Search"].map((x) => Search.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
    );

    Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
    };
}

class Search {
    Search({
        this.title,
        this.year,
        this.imdbId,
        this.type,
        this.poster,
    });

    String title;
    String year;
    String imdbId;
    Type type;
    String poster;

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map[json["Type"]],
        poster: json["Poster"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse[type],
        "Poster": poster,
    };
}

enum Type { MOVIE, GAME }

final typeValues = EnumValues({
    "game": Type.GAME,
    "movie": Type.MOVIE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

/**
 * Created by Parth Sheth.
 * Created on 30/05/23 at 2:57 pm
 */

class PokemonListResponseModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;
  String? error;

  PokemonListResponseModel.withError(String errorMessage) {
    error = errorMessage;
  }
  PokemonListResponseModel({this.count, this.next, this.previous, this.results});

  PokemonListResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results = json['results'] != null
        ? (json['results'] as List).map((i) => Results.fromJson(i)).toList()
        : List<Results>.empty();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

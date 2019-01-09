import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const url = 'http://pokeapi.salestock.net/api/v2/pokemon/?limit=811';
String specificUrl = 'http://pokeapi.salestock.net/api/v2/pokemon/';

Future<ResultList> fetchPokemonList() async {
  final response = await http.get(url);

  String res = response.body;

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return ResultList.fromJson(json.decode(res));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load pokemon');
  }
}

class ResultList {
  final int count;
  final List<Result> results;

  ResultList({this.count, this.results});

  factory ResultList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;

    List<Result> resultsList = list.map((i) => Result.fromJson(i)).toList();

    return ResultList(count: parsedJson['count'], results: resultsList);
  }
}

class Result {
  final int id;
  final String name;

  Result({this.id, this.name});

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    return Result(name: parsedJson['name']);
  }
}

Future<Pokemon> fetchPokemonData(int index) async {
  final response = await http.get(specificUrl + '$index/');

  String res = response.body;

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Pokemon.fromJson(json.decode(res));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load pokemon');
  }
}

class Pokemon {
  final int id;
  final String name;
  final int weight;
  final int height;
  final PokemonImage image;
  final List<PokemonType> types;
  

  Pokemon({this.id, this.name, this.weight, this.height,this.image,this.types});

  factory Pokemon.fromJson(Map<String, dynamic> parsedJson) {
    PokemonImage pokeImage=PokemonImage.fromJson(parsedJson['sprites']);

    var list=parsedJson['types'] as List;
    List<PokemonType>  typeList= list.map((i) => PokemonType.fromJson(i)).toList();

    return Pokemon(name: parsedJson['name'],image: pokeImage,weight: parsedJson['weight'],height: parsedJson['height'],types: typeList);
  }
}

class PokemonImage{
  final String url;

  PokemonImage({this.url});
  
  factory PokemonImage.fromJson(Map<String,dynamic> parsedJson){
    return PokemonImage(url: parsedJson['front_default']);
  }
}

class PokemonType{
  final String name;
  

  PokemonType({this.name});

  factory PokemonType.fromJson(Map<String,dynamic> parsedJson){
    var type =parsedJson['type'];
    return PokemonType(name: type['name']);
  }
}
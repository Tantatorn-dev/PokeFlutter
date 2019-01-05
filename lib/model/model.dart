import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const url = 'http://pokeapi.salestock.net/api/v2/pokemon/?limit=811';

Future<ResultList> fetchPost() async {
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
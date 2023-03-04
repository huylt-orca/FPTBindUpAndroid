

import 'dart:convert';

import 'package:android/models/test.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkRequest{
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  static List<Test> parserTest(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Test> tests = list.map((model) => Test.fromJson(model)).toList();
    return tests;
  }

  static Future<List<Test>> fetchPosts({int page =1 }) async{
    final response = await http.get(Uri.parse(url));
    if (response.statusCode ==200){
      return compute(parserTest,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }


}
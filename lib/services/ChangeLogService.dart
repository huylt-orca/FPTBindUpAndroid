import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../models/Changelog.dart';
import 'package:http/http.dart' as http;

class ChangelogService{
  static const String urlChangelog = server + "changelog/";

  static List<Changelog> parserChangelogList(String responseBody){
    var data = json.decode(responseBody) ;
    var list = data['data'] as List<dynamic>;
    List<Changelog> changelogs = list.map((model) => Changelog.fromJson(model)).toList();
    return changelogs;
  }

  static Changelog parserChangelogDetail(String responseBody){
    var data = json.decode(responseBody) ;
    var changelogJson = data['data'] ;
    Changelog changelog =  Changelog.fromJson(changelogJson);
    return changelog;
  }


  static Future<List<Changelog>> fetchChangelogList({
        int page =0,
        int pageSize =4,
        bool paging = false,
        required String projectId
      }) async{

    String options =
        "?pageSize=${pageSize}"
        "&pageNo=${page}"
        "&paging=${paging}"
        "&projectId=${projectId}"
    ;
    final response = await http.get(Uri.parse(urlChangelog + options));
    if (response.statusCode ==200){
      return compute(parserChangelogList,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }

  static Future<Changelog> fetchChangelogDetail( String changelogId  ) async{
    final response = await http.get(Uri.parse(urlChangelog + "$changelogId"));
    if (response.statusCode ==200){
      return compute(parserChangelogDetail,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }




}
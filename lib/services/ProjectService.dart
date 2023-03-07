import 'dart:convert';

import 'package:android/models/ProjectImage.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../models/Project.dart';
import 'package:http/http.dart' as http;

class ProjectService{
  static const String urlProject = server + "project/";

  static List<Project> parserProjectList(String responseBody){
    var data = json.decode(responseBody) ;
    var list = data['data']['projectDTOList'] as List<dynamic>;
    List<Project> projects = list.map((model) => Project.fromJson(model)).toList();
    return projects;
  }

  static Project parserProjectDetail(String responseBody){
    var data = json.decode(responseBody) ;
    var projectJson = data['data'] ;
    Project project =  Project.fromJson(projectJson);
    return project;
  }

  static List<ProjectImage> parserProjectImageList(String responseBody){
    var data = json.decode(responseBody) ;
    var list = data['data'] as List<dynamic>;
    List<ProjectImage> images = list.map((model) => ProjectImage.fromJson(model)).toList();
    return images;
  }

  static Future<List<Project>> fetchProjectList({int page =0 }) async{
    final response = await http.get(Uri.parse(urlProject + "?pageSize=4&sortBy=id&statusType=-1&pageNo=$page"));
    if (response.statusCode ==200){
      return compute(parserProjectList,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }

  static Future<Project> fetchProjectDetail( String projectId  ) async{
    final response = await http.get(Uri.parse(urlProject + "$projectId"));
    if (response.statusCode ==200){
      return compute(parserProjectDetail,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }

  static Future<void> postProject(Project project) async {
    var uri = Uri.parse(urlProject);

    var body = jsonEncode({
      'name': project.name,
      'summary': project.summary,
      'description': project.description,
      'source': project.source,
      'voteQuantity': 0,
      'milestone': 0,
      'founderId': '19d19cf5-68b7-4688-9a53-97f9ac2d1676',

    });
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      var response = await http.post(uri, body: body, headers: headers);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // Xử lý dữ liệu nhận được
      } else {
        // Xử lý lỗi
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Xử lý lỗi khi không kết nối được đến API hoặc khi có lỗi trong quá trình gửi yêu cầu
      print('Error: $error');
    }
  }


  static Future<List<ProjectImage>> fetchProjectImageList(String projectId) async{
    final response = await http.get(Uri.parse(urlProject + "$projectId/image/"));
    if (response.statusCode ==200){
      return compute(parserProjectImageList,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }
}
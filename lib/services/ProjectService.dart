import 'dart:convert';
import 'dart:io';

import 'package:android/controller/UserController.dart';
import 'package:android/models/ProjectImage.dart';
import 'package:android/services/StorageService.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  static Future<List<Project>> fetchProjectList({
    int page =0,
    int pageSize =4,
    String sortBy = "id",
    int statusType = 0,
    String nameKeyword = ""
  }) async{

    String options =
        "?pageSize=${pageSize}"
        "&pageNo=${page}"
        "&sortBy=${sortBy}"
        "&statusType=${statusType}"
    ;
    if (!nameKeyword.isEmpty){
      options = options + "&nameKeyWord=${nameKeyword}";
    }


    final response = await http.get(Uri.parse(urlProject + options));
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


  static Future<void> postProject(Project project,File? imageFile) async {
    UserController userController = Get.put(UserController());

    var uri = Uri.parse(urlProject);

    var body = jsonEncode({
      'name': project.name,
      'summary': project.summary,
      'description': project.description,
      'source': project.source,
      'voteQuantity': 0,
      'milestone': 0,
      'founderId': '${userController.id}',
    });
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${await StorageService.getAccessToken()}'
    };
    try {
      var response = await http.post(uri, body: body, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(responseData['data']);

        if (imageFile != null) {
          // upload image
          final urlImage = urlProject + responseData['data'] + "/logo/";
          final bytes = await imageFile.readAsBytes();
          final responseImage = await http.post(
              Uri.parse(urlImage),
              body: bytes,
              headers: headers
          );
          if (responseImage.statusCode == 200) {
            print ("Upload Successful");
          } else {
            print('Error Upload Image');
          }
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }



}
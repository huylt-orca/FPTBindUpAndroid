import 'dart:convert';
import 'dart:io';

import 'package:android/controller/ProjectController.dart';
import 'package:android/controller/UserController.dart';
import 'package:android/models/Application.dart';
import 'package:android/models/Changelog.dart';
import 'package:android/models/Job.dart';
import 'package:android/models/Member.dart';
import 'package:android/models/Mentor.dart';
import 'package:android/models/ProjectImage.dart';
import 'package:android/models/User.dart';
import 'package:android/services/StorageService.dart';
import 'package:android/services/UserService.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../models/Project.dart';
import 'package:http/http.dart' as http;

import '../models/Topic.dart';

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

  static List<ProjectImage> parserProjectImageListFromProject(var data){
    var list = data as List<dynamic>;
    List<ProjectImage> images = list.map((model) => ProjectImage.fromJson(model)).toList();
    return images;
  }


  static List<Mentor> parserMentorListFromProject(var data){
    var list = data  as List<dynamic>;
    List<Mentor> mentors = list.map((model) => Mentor.fromJson(model)).toList();
    return mentors;
  }

  static List<Member> parserMembersListFromProject(var data){
    var list = data as List<dynamic>;
    List<Member> members = list.map((model) => Member.fromJson(model)).toList();
    return members;
  }

  static List<Job> parserJobsListFromProject(var data){
    var list = data as List<dynamic>;
    List<Job> jobs = list.map((model) => Job.fromJson(model)).toList();
    return jobs;
  }

  static List<Application> parserApplicationsListFromProject(var data){
    var list = data as List<dynamic>;
    List<Application> applications = list.map((model) => Application.fromJson(model)).toList();
    return applications;
  }

  static List<Changelog> parserChangelogListFromProject(var data){
    var list = data as List<dynamic>;
    List<Changelog> changelogs = list.map((model) => Changelog.fromJson(model)).toList();
    return changelogs;
  }

  static List<Topic> parserTopicsListFromProject(var data){
    var list = data as List<dynamic>;
    List<Topic> topics = list.map((model) => Topic.fromJson(model)).toList();
    return topics;
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
    final response = await http.get(Uri.parse(urlProject + "${projectId}"));
    if (response.statusCode ==200){
      ProjectController projectController = Get.put(ProjectController());
      var data = json.decode(response.body)['data'];
      print(data['images'].length);
      
      Project project = Project.fromJson(data);
      projectController.AddProject(project);
      projectController.RemoveAllInformationProject();


      projectController.founder = Rx(User.fromJson(data['founder']));

      if (!(data['images'].length == 0)){
        List<ProjectImage> images = parserProjectImageListFromProject(data['images']);
        projectController.images = RxList(images);
      }
      if (!(data['mentors'].length == 0)){
        List<Mentor> mentors = parserMentorListFromProject(data['mentors']);
        projectController.mentors = RxList(mentors);
      }
      if (!(data['members'].length == 0)){
        List<Member> members = parserMembersListFromProject(data['members']);
        projectController.members = RxList(members);
      }
      if (!(data['jobs'].length == 0)){
        List<Job> jobs = parserJobsListFromProject(data['jobs']);
        projectController.jobs = RxList(jobs);
      }
      if (!(data['applications'].length == 0)){
        List<Application> applications = parserApplicationsListFromProject(data['applications']);
        projectController.applications = RxList(applications);
      }
      if (!(data['changelogs'].length == 0)){
        List<Changelog> changelogs = parserChangelogListFromProject(data['changelogs']);
        projectController.changelogs = RxList(changelogs);
      }
      if (!(data['topics'].length == 0)){
        List<Topic> topics = parserTopicsListFromProject(data['topics']);
        projectController.topics = RxList(topics);
      }

      return project;
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

          final request = http.MultipartRequest(
            'POST',
            Uri.parse(urlImage),
          );

          final file = await http.MultipartFile.fromPath('imageFile', imageFile.path);
          request.files.add(file);

          request.headers.addAll({'Authorization': 'Bearer ${await StorageService.getAccessToken()}'});

          final response = await request.send();

          print(response.statusCode);

          // end upload image
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  static Future<List<Project>> fetchOwnerProjectList() async{
    UserController userController = Get.put(UserController());

    final response = await http.get(Uri.parse(UserService.urlUser +"${userController.id}/projects"));
    if (response.statusCode ==200){
      return compute(parserProjectList,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }

  static Future<void> putProject(Project project) async {

    String options =
        "?id=${project.id}"
        "&name=${project.name}"
        "&summary=${project.summary}"
        "&description=${project.description}"
        "&source=${project.source}"
        "&milestone=${project.milestone}"
    ;

    var uri = Uri.parse(urlProject + options);

    // var body = jsonEncode({
    //   'id': project.id,
    //   'name': project.name,
    //   'summary': project.summary,
    //   'description': project.description,
    //   'source': project.source,
    //   'milestone': project.milestone,
    // });
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${await StorageService.getAccessToken()}'
    };
    try {
      var response = await http.put(uri, body: null, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Success Update Project");

      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }


}
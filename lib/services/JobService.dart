import 'dart:convert';

import 'package:android/controller/ProjectController.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'StorageService.dart';
import 'package:http/http.dart' as http;
class JobService{
  static const String urlJob = server + "job/";


  static Future<bool> postJob (String title, String description) async {
    ProjectController projectController = Get.put(ProjectController());

    var uri = Uri.parse(urlJob);

    var body = jsonEncode({
      'name': title,
      'description': description,
      'projectId': projectController.id.value,
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
        print ('Create Job Successful');
        return true;
      } else {
        print('Error: ${response.reasonPhrase}');
      }

    } catch (error) {
      print('Error: $error');
    }return false;
  }
}
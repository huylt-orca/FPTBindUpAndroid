import 'dart:convert';

import 'package:android/models/ProjectImage.dart';
import 'package:android/services/StorageService.dart';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../models/Project.dart';
import 'package:http/http.dart' as http;

import '../models/User.dart';

class UserService{
  static const String urlAuth = server + "auth/";
  static const String urlUser = server + "user/";


  static List<User> parserUserList(String responseBody){
    var data = json.decode(responseBody) ;
    var list = data['data']['userDTOList'] as List<dynamic>;
    List<User> users = list.map((model) => User.fromJson(model)).toList();
    return users;
  }

  static User parserUserDetail(String responseBody){
    var data = json.decode(responseBody) ;
    var userJson = data['data'] ;
    User user =  User.fromJson(userJson);
    return user;
  }

  static User parserUserId(String responseBody){
    var data = json.decode(responseBody) ;
    var userJson = data ;
    User user =  User.fromJson(userJson);
    return user;
  }

  static Future<List<User>> fetchUserList({
    int page =0,
    int pageSize =4,
    String sortBy = "id",
    int statusType = 0

  }) async{

    String options =
        "?pageSize=${pageSize}"
        "&pageNo=${page}"
        "&sortBy=${sortBy}"
        "&statusType=${statusType}"
    ;

    final response = await http.get(Uri.parse(urlUser + options));
    if (response.statusCode ==200){
      return compute(parserUserList,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }

  static Future<User> fetchUserDetail() async{
    String? accessToken = await StorageService.getAccessToken();

    final mainresponse = await http.get(
        Uri.parse(urlAuth +'?accessToken=$accessToken'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        }
    );

    if (mainresponse.statusCode ==200){
      // get User detail
      User mainUser = await compute(parserUserId,mainresponse.body);
      return mainUser;
      // final response = await http.get(
      //     Uri.parse(urlUser + "{id}?id=${mainUser.id}"),
      //     headers: {
      //       'Authorization': 'Bearer $accessToken',
      //     }
      // );
      //
      // if (response.statusCode ==200){
      //   return compute(parserUserDetail,response.body);
      // } else if (response.statusCode ==404){
      //   throw Exception('Not found');
      // } else{
      //   throw Exception('Can\'t get');
      // }
    } else if (mainresponse.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }

  }



  static Future<void> postUser(User user) async {
    var uri = Uri.parse(urlUser);

    var body = jsonEncode({
      'name': user.name,
      'description': user.description,
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
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }



}
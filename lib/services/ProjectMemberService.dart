import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../constants.dart';
import '../models/Member.dart';
import '../models/Topic.dart';
import 'package:http/http.dart' as http;

class ProjectMemberService{
  static const String urlMember = server + "member/";

  static List<Member> parserMemberList(String responseBody){
    var data = json.decode(responseBody) ;
    var list = data['data']['memberDTOList'] as List<dynamic>;
    List<Member> members = list.map((model) => Member.fromJson(model)).toList();
    return members;
  }

  static Member parserMemberDetail(String responseBody){
    var data = json.decode(responseBody) ;
    var memberJson = data['data'] ;
    Member topic =  Member.fromJson(memberJson);
    return topic;
  }


  static Future<List<Member>> fetchMemberList({int page =0 }) async{
    final response = await http.get(Uri.parse(urlMember + "?pageSize=4&sortBy=id&statusType=-1&pageNo=$page"));
    if (response.statusCode ==200){
      return compute(parserMemberList,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }

  static Future<Member> fetchMemberDetail( String memberId  ) async{
    final response = await http.get(Uri.parse(urlMember + "$memberId"));
    if (response.statusCode ==200){
      return compute(parserMemberDetail,response.body);
    } else if (response.statusCode ==404){
      throw Exception('Not found');
    } else{
      throw Exception('Can\'t get');
    }
  }




}
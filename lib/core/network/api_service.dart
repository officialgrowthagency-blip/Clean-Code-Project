
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skill_develop_project/core/network/network_response.dart';

class ApiService {

  Future<NetworkResponse> getCrudApiData (String endPoint) async {

   final String baseUrl = "https://fakestoreapi.com/";

    final uri = Uri.parse("$baseUrl/$endPoint");

    try {

      final response = await http.get(uri);

        if(response.statusCode == 200){
        return NetworkResponse(
        statusCode:  response.statusCode, 
        isSuccess: true, 
        responseData: jsonDecode(response.body),
      );

        } else {
          return NetworkResponse(
          statusCode: response.statusCode, 
          isSuccess: false,
          
          );
        }

    } catch (e) {
       return NetworkResponse(
        statusCode: -1, 
        isSuccess: false, 
        errorMessage: e.toString()
      );
    }
  }


  Future<NetworkResponse> postApiData (String endPoint, {Map<String, dynamic>? body}) async {

    final String baseUrl = "https://fakestoreapi.com/";

     final uri = Uri.parse("$baseUrl/$endPoint");

      try {

       Map<String, String> headers = {
        'Content-Type': 'application/json',
       };
        final response = await http.post(
          uri, 
          headers: headers,
          body: body != null ? jsonEncode(body): null);

          if(response.statusCode == 200 || response.statusCode == 201){

               debugPrint("Post Reguest : ${response.body}");
               
             return NetworkResponse(
              statusCode: response.statusCode, 
              isSuccess: true,
              responseData: jsonDecode(response.body),
              );
           
          } else {
          return NetworkResponse(
          statusCode: response.statusCode, 
          isSuccess: false,
          
          );
        }
           

      } catch (e){
         return NetworkResponse(
        statusCode: -1, 
        isSuccess: false, 
        errorMessage: e.toString()
      );

      }


  }




}

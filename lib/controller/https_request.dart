import 'dart:convert';

import 'package:http/http.dart'as http;
import '../models/getmodels.dart';


class RequestControllers {
  var base = "https://dummyjson.com";
  var end = "products";

  Future<UserDataModelTest> getData() async {
    final response =await http.get(Uri.parse("$base/$end"));
    try{
      if(response.statusCode == 200){
        var decodeResponse = jsonDecode(response.body);
        var modelTest = UserDataModelTest.fromJson(decodeResponse);
        return modelTest;
      }
      else{
        return UserDataModelTest();
      }
    }
    catch(e){
      return UserDataModelTest();
    }
  }
}


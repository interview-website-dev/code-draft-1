import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app/reusable_code_blocks/gobalConstants.dart';
class City {
  String? cityName;
  

  City({
    this.cityName,
   
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        cityName: json['city'],
    );
  }
}
final Uri apiURL = Uri.http(SERVER_URL, "interview_app_phpfiles/city_list.php");
// 'http://192.168.29.153/interview_app_phpfiles/city_list.php';
class CitiesViewModel {
  static List<City>? cities;

  static Future loadCities() async {
   var response = await http.get(apiURL);
 
   
 
      final items = jsonDecode(response.body);
 
      List<City> studentList = items.map<City>((json) {
        return City.fromJson(json);
      }).toList();
      cities = studentList;
    }
}
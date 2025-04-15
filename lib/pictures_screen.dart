import 'dart:convert';

import 'package:api_implementation/models/pictures_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PicturesScreen extends StatelessWidget{
  PicturesScreen({super.key});
  List<PicturesModel> picturesList = [];
  Future<List<PicturesModel>> getPicturesList() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body).toString();
    if(response.statusCode == 200){
      picturesList.clear();
      for(Map<String, dynamic> i in data){
        picturesList.add(PicturesModel.fromJson(i));
      }
    }else{
      return picturesList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Yet to come...', 
    style: TextStyle(fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent),
    ),);
  }
}
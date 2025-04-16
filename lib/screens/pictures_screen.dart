import 'dart:convert';

import 'package:api_implementation/models/pictures_model.dart';
import 'package:api_implementation/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PicturesScreen extends StatefulWidget {
  const PicturesScreen({super.key});
  @override
  State<PicturesScreen> createState(){
    return _PicturesScreenState();
  }
}
  class _PicturesScreenState extends State<PicturesScreen>{  
  List<Photos> picturesList = [];
  Future<List<Photos>> getPicturesList() async {
    final response = await http.get(Uri.parse(
        'https://api.slingacademy.com/v1/sample-data/photos?offset=5&limit=200'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      picturesList.clear();
      for (Map<String, dynamic> i in data['photos']) {
        picturesList.add(Photos.fromJson(i));
      }
      return picturesList;
    } else {
      return picturesList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPicturesList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading...');
          } else {
            final pictureList = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: pictureList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProductDetails(photo:snapshot.data![index]);
                        }))                      
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(249, 223, 222, 221),
                            borderRadius: BorderRadius.circular(16)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Title: ${snapshot.data![index].title}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                        fontSize: 12),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    snapshot.data![index].url ??
                                        'https://picsum.photos/200',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Description: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.black54),
                              ),
                              Text(
                                snapshot.data![index].description ??
                                    'No description available',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
        });
  }
}

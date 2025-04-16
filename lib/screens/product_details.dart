import 'package:api_implementation/models/pictures_model.dart';
import 'package:flutter/material.dart';
class ProductDetails extends StatelessWidget{
  const ProductDetails({super.key, required this.photo});
  final Photos photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Api Course',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.star))
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: const Column(
        children: [
          Text(''),
        ],
      ),
    );
  }
  
}
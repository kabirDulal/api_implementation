import 'package:api_implementation/models/pictures_model.dart';
import 'package:flutter/material.dart';
class ProductDetails extends StatelessWidget{
  const ProductDetails({super.key, required this.photo});
  final Photos photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
      body: Container(        
        margin: EdgeInsets.all(16),
        child: Column(        
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(photo.title ?? 'Product not Available',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8,),
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(photo.url!, fit: BoxFit.fill,)),
              
              ),
            const SizedBox(height: 12,),
            Text('Description:',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5,),
            Text(photo.description ?? 'Product not Available',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left,
            ),
          ],
        ),
      ),      
    );
  }
  
}
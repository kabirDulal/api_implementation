import 'dart:convert';
import 'package:api_implementation/screens/pictures_screen.dart';
import 'package:api_implementation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_implementation/models/posts_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map<String, dynamic> i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  int _currentIndex = 0;
  void _onTabTapped(int index) {
    if (_currentIndex == 2) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignupScreen()),
          (Route<dynamic> route) => false);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  Widget _getBody() {
    if (_currentIndex == 0) {
      return Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: const Color.fromARGB(255, 2, 49, 71),
                          surfaceTintColor:
                              const Color.fromARGB(255, 231, 9, 9),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title\n' + postList[index].title.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryFixedVariant,
                                      ),
                                ),
                                Text('Description\n' +
                                    postList[index].body.toString()),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      );
    } else if (_currentIndex == 1) {
      return const PicturesScreen();
    } else {
      return const SignupScreen();
    }
  }

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
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 233, 139, 132),
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
                label: 'Card Details', icon: Icon(Icons.card_membership)),
            BottomNavigationBarItem(
                label: 'Pictures', icon: Icon(Icons.picture_in_picture)),
            BottomNavigationBarItem(
                label: 'Log Out', icon: Icon(Icons.logout_outlined)),
          ]),
    );
  }
}

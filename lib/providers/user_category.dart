import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shareskill/models/category.dart';

class UserCategory with ChangeNotifier {
  List<Category> _categories = [
    Category(
      id: 'cat0',
      title: 'Shouting',
      icon: Icon(Icons.notifications_active),
      color: Colors.yellow,
    ),
    Category(
      id: 'cat1',
      title: 'Singing',
      icon: Icon(Icons.music_note),
      color: Colors.red,
    ),
    Category(
      id: 'cat2',
      title: 'Dancing',
      icon: Icon(Icons.laptop_mac),
      color: Colors.grey,
    ),
    Category(
      id: 'cat3',
      title: 'Writing',
      icon: Icon(Icons.text_fields),
      color: Colors.indigo,
    ),
    Category(
      id: 'cat4',
      title: 'Playing',
      icon: Icon(Icons.games),
      color: Colors.lightGreen,
    ),
  ];

  List<Category> get categories {
    return [..._categories];
  }
}

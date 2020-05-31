import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Icon icon;
  final Color color;

  Category({
    this.id,
    @required this.title,
    this.icon,
    this.color,
  });
}

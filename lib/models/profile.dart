import 'dart:io';

import 'package:flutter/foundation.dart';

class Profile {
  final String id;
  final String name;
  final File photo;
  final List<String> category;
  final String address;

  Profile({
    @required this.id,
    @required this.name,
    @required this.photo,
    @required this.category,
    @required this.address,
  });
}

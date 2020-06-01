import 'dart:io';

import 'package:flutter/foundation.dart';

class Profile {
  final String id;
  final String firstName;
  final String lastName;
  final File photo;
  final List<String> category;
  
  final String address;

  Profile({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.photo,
    @required this.category,
    @required this.address,
  });
}

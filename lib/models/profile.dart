import 'dart:io';

import 'package:flutter/foundation.dart';

class Profile {
  final String id;
  final String firstName;
  final String lastName;
  File photo;
  final List<String> category;
  final String phoneNumber;
  final String address;

  Profile({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    this.photo,
    @required this.category,
    @required this.phoneNumber,
    @required this.address,
  });
}

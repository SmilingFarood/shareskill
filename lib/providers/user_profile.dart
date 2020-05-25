import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shareskill/models/profile.dart';

class UserProfile with ChangeNotifier {
  List<Profile> _profiles = [
    Profile(
      id: 'Asa123',
      name: 'Asa',
      photo: null,
      category: ['Singing', 'Dancing', 'Playing', 'Shouting', 'Writing'],
      address: 'Futa South Gate',
    ),
    Profile(
      id: 'MichaelJackson123',
      name: 'Michael Jackson',
      photo: null,
      category: ['Writing', 'Playing'],
      address: 'Apatapiti',
    ),
    Profile(
      id: 'Nairamarley123',
      name: 'NairaMarley',
      photo: null,
      category: ['Singing', 'Playing'],
      address: 'Obanla',
    ),
    Profile(
      id: 'brymo123',
      name: 'Brymo',
      photo: null,
      category: ['Writing', 'Dancing'],
      address: 'Inside Town',
    ),
  ];

  List<Profile> get profiles {
    return [..._profiles];
  }

  List<Profile> loadProfile(String categoryReceived) {
    var profileWithThisSkills = profiles
        .where((profile) => profile.category.contains(categoryReceived));
    return profileWithThisSkills.toList();
  }

  void addProfile({String name, File photo, List category, String address}) {}

  Profile singleProfile({String receivedId}) {
    final foundProfile =
        profiles.firstWhere((element) => element.id.contains(receivedId), orElse: () => null);

    return foundProfile;
  }
}

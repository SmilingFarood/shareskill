import 'package:flutter/cupertino.dart';
import 'package:shareskill/models/profile.dart';

class UserProfile with ChangeNotifier {
  List<Profile> _profiles = [
    Profile(
      id: DateTime.now().toString(),
      name: 'Asa',
      photo: null,
      category: ['Singing', 'Dancing'],
      address: 'Futa South Gate',
    ),
    Profile(
      id: DateTime.now().toString(),
      name: 'Michael Jackson',
      photo: null,
      category: ['Writing', 'Playing'],
      address: 'Apatapiti',
    ),
    Profile(
      id: DateTime.now().toString(),
      name: 'NairaMarley',
      photo: null,
      category: ['Singing', 'Playing'],
      address: 'Obanla',
    ),
    Profile(
      id: DateTime.now().toString(),
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
    
    profiles.forEach((element) {
      element.category.contains(categoryReceived);
      // print(profiles.toString());
    });
    // print(profiles);
    
  }
}

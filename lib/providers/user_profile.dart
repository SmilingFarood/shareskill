import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shareskill/models/profile.dart';

class UserProfile with ChangeNotifier {
  List<Profile> _profiles = [
    // Profile(
    //   id: 'Asa123',
    //   firstName: 'Asa',
    //   lastName: 'Musicals',
    //   photo: null,
    //   category: ['Singing', 'Dancing', 'Playing', 'Shouting', 'Writing'],
    //   address: 'Futa South Gate',
    // ),
    // Profile(
    //   id: 'MichaelJackson123',
    //   firstName: 'Michael',
    //   lastName: 'Jackson',
    //   photo: null,
    //   category: ['Writing', 'Playing'],
    //   address: 'Apatapiti',
    // ),
    // Profile(
    //   id: 'Nairamarley123',
    //   firstName: 'NairaMarley',
    //   lastName: 'comeForward',
    //   photo: null,
    //   category: ['Singing', 'Playing'],
    //   address: 'Obanla',
    // ),
    // Profile(
    //   id: 'brymo123',
    //   firstName: 'Brymo',
    //   lastName: 'Art of music',
    //   photo: null,
    //   category: ['Writing', 'Dancing'],
    //   address: 'Inside Town',
    // ),
  ];

  List<Profile> get profiles {
    return [..._profiles];
  }

  List<Profile> loadProfile(String categoryReceived) {
    var profileWithThisSkills = profiles
        .where((profile) => profile.category.contains(categoryReceived));
    return profileWithThisSkills.toList();
  }

  void addProfile({
    @required String firstName,
    @required String lastName,
    File photo,
    @required List category,
    @required String address,
  }) {
    final newProfile = Profile(
      id: DateTime.now().toString(),
      firstName: firstName,
      lastName: lastName,
      photo: photo,
      category: category,
      address: address,
    );
    _profiles.add(newProfile);
    notifyListeners();
  }

  Profile singleProfile({String receivedId}) {
    final foundProfile = profiles.firstWhere(
        (element) => element.id.contains(receivedId),
        orElse: () => null);

    return foundProfile;
  }
}

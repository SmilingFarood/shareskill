import 'package:flutter/cupertino.dart';
import 'package:shareskill/models/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:dio/dio.dart';

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

  Future<void> addProfile({Profile profile}) async {
    const url = 'https://shareskill-67d33.firebaseio.com/user_profiles.json';
    try {
     
      final response = await http.post(
        url,
        body: json.encode(
          {
            'id': profile.id,
            'firstName': profile.firstName,
            'lastName': profile.lastName,
            'photo': profile.photo,
            'category': profile.category,
            'phoneNumber': profile.phoneNumber,
            'address': profile.address,
          },
        ),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
    final newProfile = Profile(
      id: profile.id,
      firstName: profile.firstName,
      lastName: profile.lastName,
      photo: profile.photo,
      category: profile.category,
      phoneNumber: profile.phoneNumber,
      address: profile.address,
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

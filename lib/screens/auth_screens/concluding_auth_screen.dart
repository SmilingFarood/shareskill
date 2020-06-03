import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/models/profile.dart';
import 'package:shareskill/providers/user_profile.dart';
import 'package:shareskill/screens/category_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ConcludingAuthScreen extends StatelessWidget {
  const ConcludingAuthScreen({Key key}) : super(key: key);

  static const routeName = 'concluding-auth-screen';

  @override
  Widget build(BuildContext context) {
    final response = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.amberAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
          ),
          Container(
            child: Center(
              child: LoadingAllData(
                finalData: response,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingAllData extends StatelessWidget {
  final Map finalData;
  LoadingAllData({@required this.finalData});

  @override
  Widget build(BuildContext context) {
    // final List listOfCategories = finalData['selectedCategories'];
    // final Map<String, String> authDetails = finalData['authDetails'];
    // final Map<String, String> contactDetails = finalData['contactDetails'];
    // final File imageFile = finalData['imageFile'];

    final String email = finalData['authDetails']['email'];
    final String password = finalData['authDetails']['password'];
    final String firstName = finalData['contactDetails']['firstName'];
    final String lastName = finalData['contactDetails']['lastName'];
    final String phoneNumber = finalData['contactDetails']['phoneNumber'];
    final String address = finalData['contactDetails']['address'];
    final List<String> categories = finalData['selectedCategories'];
    final File profilePhoto = finalData['imageFile'];

    var _profile = Profile(
      id: DateTime.now().toString(),
      firstName: firstName,
      lastName: lastName,
      photo: profilePhoto,
      category: categories,
      phoneNumber: phoneNumber,
      address: address,
    );

    Future<void> completeSignup() async {
      Provider.of<UserProfile>(context, listen: false)
          .addProfile(profile: _profile);
      Navigator.of(context).pushNamed(CategoryListScreen.routeName);
    }

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        color: Colors.white,
        height: 500,
        width: 400,
        child: Column(
          children: <Widget>[
            Container(
                width: 300,
                height: 300,
                child: profilePhoto == null
                    ? Text('No profile Picture selected')
                    : Image.file(
                        profilePhoto,
                        fit: BoxFit.cover,
                      )),
            Text(email),
            Text(password.toString()),
            Text(firstName),
            Text(lastName),
            Text(categories.toString()),
            Text(address),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('Confirm Details'),
              onPressed: completeSignup,
            ),
          ],
        ),
      ),
    );
  }
}

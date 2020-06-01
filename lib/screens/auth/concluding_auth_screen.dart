import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_profile.dart';
import 'package:shareskill/screens/category_screen.dart';

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
    // print(email);
    final String password = finalData['authDetails']['password'];
    // print(password);
    final String firstName = finalData['contactDetails']['firstName'];
    // print(firstName);
    final String lastName = finalData['contactDetails']['lastName'];
    // print(lastName);
    final String phoneNumber = finalData['contactDetails']['phoneNumber'];
    print(phoneNumber);
    final String address = finalData['contactDetails']['address'];
    // print(address);
    final List<String> categories = finalData['selectedCategories'];
    // print(categories);
    final File photo = finalData['imageFile'];
    // print(photo);

    void completeSignup() {
      Provider.of<UserProfile>(context, listen: false).addProfile(
        firstName: firstName,
        lastName: lastName,
        photo: photo,
        category: categories,
        address: address,
      );
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
                child: photo == null
                    ? Text('No profile Picture selected')
                    : Image.file(
                        photo,
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

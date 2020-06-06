import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConcludingAuthScreen extends StatefulWidget {
  const ConcludingAuthScreen({Key key}) : super(key: key);

  static const routeName = 'concluding-auth-screen';

  @override
  _ConcludingAuthScreenState createState() => _ConcludingAuthScreenState();
}

class _ConcludingAuthScreenState extends State<ConcludingAuthScreen> {
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

class LoadingAllData extends StatefulWidget {
  final Map finalData;
  LoadingAllData({@required this.finalData});

  @override
  _LoadingAllDataState createState() => _LoadingAllDataState();
}

class _LoadingAllDataState extends State<LoadingAllData> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final String _email = widget.finalData['authDetails']['email'];
    final String _password = widget.finalData['authDetails']['password'];
    final String _firstName = widget.finalData['contactDetails']['firstName'];
    final String _lastName = widget.finalData['contactDetails']['lastName'];
    final String _phoneNumber =
        widget.finalData['contactDetails']['phoneNumber'];
    final String _address = widget.finalData['contactDetails']['address'];
    final List<String> _categories = widget.finalData['selectedCategories'];
    final File _profilePhoto = widget.finalData['imageFile'];

    void _completeSignup() async {
      AuthResult authResult;

      if (_profilePhoto == null ||
          _categories == null ||
          _categories.length < 1 ||
          _email == null ||
          _firstName == null ||
          _lastName == null ||
          _phoneNumber == null ||
          _address == null ||
          _password == null) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Ensure to fill on all fields'),
          ),
        );
        return;
      }

      try {
        setState(() {
          _isLoading = true;
        });
        authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.trim(),
          password: _password.trim(),
        );

        final ref = FirebaseStorage.instance
            .ref()
            .child('profile_picture')
            .child(authResult.user.uid + 'jpg');

        await ref.putFile(_profilePhoto).onComplete;

        final url = await ref.getDownloadURL();

        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'email': _email,
          'firstName': _firstName,
          'lastName': _lastName,
          'phoneNumber': _phoneNumber,
          'address': _address,
          'categories': _categories,
          'image_Url': url,
        });
        setState(() {
          _isLoading = false;
        });
      } on PlatformException catch (error) {
        var errMessage = 'An error occured';
        if (error.message != null) {
          errMessage = error.message;
        }
        setState(() {
          _isLoading = false;
        });

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(errMessage),
          ),
        );
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
          ),
        );
      }
    }

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        height: 500,
        width: 400,
        child: Column(
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child: _profilePhoto == null
                  ? Text('No profile Picture selected')
                  : Image.file(
                      _profilePhoto,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 15),

            Row(
              children: <Widget>[
                Text('Email'),
                SizedBox(width: 15),
                Text(_email),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Firstname'),
                SizedBox(width: 15),
                Text(_firstName),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Lastname'),
                Text(_lastName),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Phone number'),
                Text(_phoneNumber),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (ctx, index) => Text(
                  _categories[index],
                ),
              ),
            ),
            // Text(_categories.toString()),
            Row(
              children: <Widget>[
                Text('Address'),
                Text(_address),
              ],
            ),
            if (_isLoading)
              CircularProgressIndicator()
            else
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text('Confirm Details'),
                onPressed: _completeSignup,
              ),
          ],
        ),
      ),
    );
  }
}

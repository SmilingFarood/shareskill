import 'package:flutter/material.dart';

import 'package:shareskill/screens/auth/profile_photo_screen.dart';

class NameInputScreen extends StatelessWidget {
  const NameInputScreen({Key key}) : super(key: key);
  static const routeName = '/name-input-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
              child: NameInputFields(),
            ),
          ),
        ],
      ),
    );
  }
}

class NameInputFields extends StatelessWidget {
  NameInputFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mdData = MediaQuery.of(context).size;
    return Container(
      child: Card(
        elevation: 20,
        child: Container(
          height: mdData.height * 0.63,
          width: 300,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isNotEmpty) {
                        return 'Value';
                      }
                      // Come back to this later
                      return value;
                    },
                  ),

                  // Second input

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isNotEmpty) {
                        return 'Value';
                      }
                      // Come back to this later
                      return value;
                    },
                  ),

                  // Third input

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value.isNotEmpty) {
                        return 'Value';
                      }
                      // Come back to this later
                      return value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    keyboardType: TextInputType.phone,
                    maxLines: 5,
                    validator: (value) {
                      if (value.isNotEmpty) {
                        return 'Value';
                      }
                      // Come back to this later
                      return value;
                    },
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Back'),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        textColor: Theme.of(context).primaryColor,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                              ProfilePhotoScreen.routeName);
                        },
                        child: Text('Continue'),
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

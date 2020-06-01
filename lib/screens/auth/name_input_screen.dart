import 'package:flutter/material.dart';

import 'package:shareskill/screens/auth/profile_photo_screen.dart';

class NameInputScreen extends StatelessWidget {
  static const routeName = '/name-input-screen';

  @override
  Widget build(BuildContext context) {
    final _authReceived = ModalRoute.of(context).settings.arguments as Map;
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
              child: NameInputFields(_authReceived),
            ),
          ),
        ],
      ),
    );
  }
}

class NameInputFields extends StatefulWidget {
  final Map receivedData;
  NameInputFields(this.receivedData);

  @override
  _NameInputFieldsState createState() => _NameInputFieldsState();
}

class _NameInputFieldsState extends State<NameInputFields> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _contactDetails = {
    'firstName': '',
    'lastName': '',
    'phoneNumber': '',
    'address': '',
  };

  void _saveForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Navigator.of(context)
        .pushReplacementNamed(ProfilePhotoScreen.routeName, arguments: {
      'contactDetails': _contactDetails,
      'authDetails': widget.receivedData,
    });
  }

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
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      _contactDetails['firstName'] = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Your Firstname';
                      }
                    },
                  ),

                  // Second input

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      _contactDetails['lastName'] = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Your Lastname';
                      }
                    },
                  ),

                  // Third input

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      _contactDetails['phoneNumber'] = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Your Phone Number';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    keyboardType: TextInputType.phone,
                    onSaved: (value) {
                      _contactDetails['address'] = value;
                    },
                    maxLines: 2,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Your Address';
                      }
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
                          _saveForm();
                          // print(widget.receivedData);
                          // print(_receivedAuthDetails);
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

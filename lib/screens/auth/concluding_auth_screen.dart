import 'package:flutter/material.dart';
// import 'package:shareskill/screens/auth_screen.dart';

class ConcludingAuthScreen extends StatelessWidget {
  const ConcludingAuthScreen({Key key}) : super(key: key);

  static const routeName = 'concluding-auth-screen';

  @override
  Widget build(BuildContext context) {
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
              child: SendingAllData(),
            ),
          ),
        ],
      ),
    );
  }
}

class SendingAllData extends StatefulWidget {
  @override
  _SendingAllDataState createState() => _SendingAllDataState();
}

class _SendingAllDataState extends State<SendingAllData> {
  // String email;
  // String password;
  // void _getAuthDetails({Map<String, String> authDetailsReceived}) {
  //   email = authDetailsReceived['email'];
  //   password = authDetailsReceived['password'];
  // }

  @override
  Widget build(BuildContext context) {
    // print(email);
    // print(password);
    return Center(
      child: CircularProgressIndicator(),
      // AuthenticationCard(sendingAuthDetails: _getAuthDetails),
    );
  }
}

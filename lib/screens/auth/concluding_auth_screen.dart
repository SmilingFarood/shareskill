import 'package:flutter/material.dart';

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
              child: null,
            ),
          ),
        ],
      ),
    );
  }
}

class SendingAllData extends StatelessWidget {
  const SendingAllData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

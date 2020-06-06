import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shareskill/screens/edit_profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello User'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.indigo, size: 30,),
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.headline2,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(EditProfileScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.indigo, size: 30,),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline2,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

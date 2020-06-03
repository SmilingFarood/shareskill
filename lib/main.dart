import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/auth.dart';
import 'package:shareskill/providers/user_category.dart';
import 'package:shareskill/providers/user_profile.dart';
import 'package:shareskill/screens/all_profiles.dart';
import 'package:shareskill/screens/auth_screens/concluding_auth_screen.dart';
import 'package:shareskill/screens/auth_screen.dart';
import 'package:shareskill/screens/auth_screens/category_input_screen.dart';
import 'package:shareskill/screens/category_screen.dart';
import 'package:shareskill/screens/edit_profile_screen.dart';
import 'package:shareskill/screens/auth_screens/name_input_screen.dart';
import 'package:shareskill/screens/profile_list_screen.dart';
import 'package:shareskill/screens/auth_screens/profile_photo_screen.dart';
import 'package:shareskill/screens/single_user_profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: UserCategory(),
        ),
        ChangeNotifierProvider.value(
          value: UserProfile(),
        ),
      ],
      child: MaterialApp(
        title: 'Skill Share',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
            headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            headline5: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            headline6: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        home: AuthScreen(),
        routes: {
          CategoryListScreen.routeName: (ctx) => CategoryListScreen(),
          ProfileListScreen.routeName: (ctx) => ProfileListScreen(),
          AllProfiles.routeName: (ctx) => AllProfiles(),
          EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
          SingleUserProfileScreen.routeName: (ctx) => SingleUserProfileScreen(),
          NameInputScreen.routeName: (ctx) => NameInputScreen(),
          ProfilePhotoScreen.routeName: (ctx) => ProfilePhotoScreen(),
          CategoryInputScreen.routeName: (ctx) => CategoryInputScreen(),
          ConcludingAuthScreen.routeName: (ctx) => ConcludingAuthScreen(),
        },
      ),
    );
  }
}

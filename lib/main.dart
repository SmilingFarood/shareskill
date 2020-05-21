import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_category.dart';
import 'package:shareskill/providers/user_profile.dart';
import 'package:shareskill/screens/all_profiles.dart';
import 'package:shareskill/screens/category_screen.dart';
import 'package:shareskill/screens/profile_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
        ),
        home: CategoryScreen(),
        routes: {
          ProfileListScreen.routeName: (ctx) => ProfileListScreen(),
          AllProfiles.routeName: (ctx) => AllProfiles(),
        },
      ),
    );
  }
}

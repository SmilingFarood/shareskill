import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/models/profile.dart';
import 'package:shareskill/providers/user_profile.dart';
import 'package:shareskill/widgets/profile_list.dart';

class ProfileListScreen extends StatefulWidget {
  static const routeName = 'profile-list-screen';

  final List<Profile> availableProfile;
  ProfileListScreen({this.availableProfile});

  @override
  _ProfileListScreenState createState() => _ProfileListScreenState();
}

class _ProfileListScreenState extends State<ProfileListScreen> {
  String categoryTitle;
  String categoryId;
  List<Profile> displayedProfile;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    categoryId = routeArgs['id'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final answer = Provider.of<UserProfile>(context).listedProfile(categoryId);
    // print(answer);
    final loadedProfiles =
        Provider.of<UserProfile>(context).loadProfile(categoryTitle);

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemCount: loadedProfiles.length,
          itemBuilder: (ctx, i) => ProfileList(
            id: loadedProfiles[i].id,
            name: loadedProfiles[i].firstName,
            category: loadedProfiles[i].category,
          ),
        )
        // ProfileList(),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_profile.dart';
import 'package:shareskill/widgets/profile_list.dart';

class AllProfiles extends StatefulWidget {
  static const routeName = '/all-profiles';

  @override
  _AllProfilesState createState() => _AllProfilesState();
}

class _AllProfilesState extends State<AllProfiles> {
  @override
  Widget build(BuildContext context) {
    final allProfiles = Provider.of<UserProfile>(context);
    final loadedProfiles = allProfiles.profiles;
    return Scaffold(
        appBar: AppBar(
          title: Text('All Profiles'),
        ),
        body: ListView.builder(
          itemCount: loadedProfiles.length,
          itemBuilder: (ctx, i) => ProfileList(
            id: loadedProfiles[i].id,
            name: loadedProfiles[i].firstName,
            category: loadedProfiles[i].category,
            photo: loadedProfiles[i].photo,
          ),
        ));
  }
}

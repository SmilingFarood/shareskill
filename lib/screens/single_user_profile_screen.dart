import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_profile.dart';
import 'package:shareskill/widgets/single_user_profile.dart';

class SingleUserProfileScreen extends StatelessWidget {
  const SingleUserProfileScreen({Key key}) : super(key: key);
  static const routeName = '/single-user-profile';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final receivedId = routeArgs['profileId'];

    final singleLoadedProfile =
        Provider.of<UserProfile>(context).singleProfile(receivedId: receivedId);

    return SingleUserProfile(
      name: singleLoadedProfile.name,
      address: singleLoadedProfile.address,
      category: singleLoadedProfile.category,
    );
  }
}

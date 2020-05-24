import 'package:flutter/material.dart';
import 'package:shareskill/widgets/edit_profile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key key}) : super(key: key);
  static const routeName = '/edit-profile-screen';

  @override
  Widget build(BuildContext context) {
    return EditProfile();
  }
}

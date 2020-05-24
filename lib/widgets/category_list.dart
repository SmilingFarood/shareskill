import 'package:flutter/material.dart';
import 'package:shareskill/screens/profile_list_screen.dart';

class CategoryList extends StatelessWidget {
  final String id;
  final String title;
  final Icon icon;
  final Color color;

  CategoryList({
    @required this.id,
    @required this.title,
    @required this.icon,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProfileListScreen.routeName, arguments: {
              'id': id,
              'title': title,
            });
          },
          child: Container(
            child: ListTile(
              leading: CircleAvatar(
                maxRadius: 25,
                backgroundColor: color,
                child: icon,
              ),
              title: Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}

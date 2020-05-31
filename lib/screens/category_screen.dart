import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_category.dart';
import 'package:shareskill/screens/all_profiles.dart';
import 'package:shareskill/screens/app_drawer_screen.dart';
import 'package:shareskill/widgets/category_list.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key key}) : super(key: key);
  static const routeName = '/category-list-screen';

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<UserCategory>(context).categories;
    return Scaffold(
      appBar: AppBar(
        title: Text('Skill Share'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(AllProfiles.routeName);
              },
              icon: Icon(
                Icons.all_inclusive,
                color: Theme.of(context).accentColor,
              ),
              label: Text(
                'ShowAll',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ))
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, i) => CategoryList(
          id: categories[i].id,
          title: categories[i].title,
          icon: categories[i].icon,
          color: categories[i].color,
        ),
      ),
    );
  }
}

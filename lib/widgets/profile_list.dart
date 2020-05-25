import 'package:flutter/material.dart';
import 'package:shareskill/screens/single_user_profile_screen.dart';

class ProfileList extends StatelessWidget {
  final String name;
  final List<String> category;
  final String id;

  ProfileList({
    @required this.name,
    @required this.category,
    @required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(SingleUserProfileScreen.routeName, arguments: {
              'profileId': id,
            });
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    'lib/assets/images/product-placeholder.png',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.account_circle),
                          SizedBox(
                            width: 5,
                          ),
                          Text(name),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.category),
                          SizedBox(
                            width: 5,
                          ),
                          // Container(child: Row(),)
                          Container(
                            child: Container(
                              // color: Colors.purple,
                              constraints: BoxConstraints(
                                maxHeight: 30,
                                minWidth: 30,
                                maxWidth: 200,
                              ),
                              child: ListView.builder(
                                itemExtent: 55,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: category.length,
                                itemBuilder: (ctx, i) => Center(
                                  child: Text(
                                    category[i] + ',',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   category.toString(),
                          //   overflow: TextOverflow.ellipsis,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Divider(),
      ],
    );
  }
}

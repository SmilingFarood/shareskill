import 'package:flutter/material.dart';

class SingleUserProfile extends StatelessWidget {
  final String name;

  SingleUserProfile({
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(name),
              background: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: queryData.size.width * 0.3,
                    height: queryData.size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
        ],
      ),
    );
  }
}

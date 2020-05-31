import 'package:flutter/material.dart';

class SingleUserProfile extends StatelessWidget {
  final String name;
  final String address;
  final List<String> category;

  SingleUserProfile({
    @required this.name,
    @required this.address,
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);

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
              [
                // Skill Container
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      
                      height: 180,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Skills',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Divider(),
                          // Beginning of error
                          Expanded(
                            child: ListView.builder(
                              itemCount: category.length,
                              itemBuilder: (context, i) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 80,
                                    child: Text(
                                      category[i],
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 20,
                                  // ),
                                  Expanded(
                                    flex: 5,
                                    child: LinearProgressIndicator(
                                      value: 0.6,
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.orange),
                                      backgroundColor: Colors.indigo,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //  end of errot

                          // Text(category.toString())
                        ],
                      ),
                    ),
                  ),
                ),

                // End of skill container

                // Start of Contact Container
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Contact Details',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: queryData.size.width * 0.05,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.phone,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(
                                        width: queryData.size.width * 0.02),
                                    Text(
                                      '+123456789',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.mail,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(
                                        width: queryData.size.width * 0.02),
                                    Text(
                                      'john@doe.com',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: queryData.size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_city,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(
                                        width: queryData.size.width * 0.02),
                                    Text(
                                      address,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // End of Contact Container
              ],
            ),
          ),
        ],
      ),
    );
  }
}

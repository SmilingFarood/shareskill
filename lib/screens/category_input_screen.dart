import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_category.dart';

class CategoryInputScreen extends StatelessWidget {
  const CategoryInputScreen({Key key}) : super(key: key);
  static const routeName = '/category-input-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.amberAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
          ),
          Center(
            child: CategoryCard(),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard({Key key}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<UserCategory>(context).categories;
    return Container(
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 300,
          width: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryData.length,
            itemBuilder: (ctx, i) => Wrap(
                spacing: 5.0,
                runSpacing: 3.0,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: FilterChip(
                      label: Text(categoryData[i].title),
                      avatar: CircleAvatar(
                        child: Text(categoryData[i].title[0].toUpperCase()),
                      ),
                      selected: _isSelected,
                      onSelected: (isSelected) {
                        if(_isSelected == false){
                         setState(() {
                            _isSelected = true;
                         });
                        }else{
                         setState(() {
                            _isSelected = false;
                         });
                        }
                      },
                      backgroundColor: categoryData[i].color,
                      selectedColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_category.dart';

class CategoryInputScreen extends StatelessWidget {
  static const routeName = '/category-input-screen';

  @override
  Widget build(BuildContext context) {
    final finalReceivedData =
        ModalRoute.of(context).settings.arguments as dynamic;
    print(finalReceivedData);
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
            child: CategoryCard(
              totalOfAllReceivedData: finalReceivedData,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final dynamic totalOfAllReceivedData;
  CategoryCard({this.totalOfAllReceivedData});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.totalOfAllReceivedData);
    final categoryData =
        Provider.of<UserCategory>(context, listen: false).categories;
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
            itemBuilder: (ctx, i) => CategoryFilterChips(
              chipLabel: categoryData[i].title,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryFilterChips extends StatefulWidget {
  final String chipLabel;
  const CategoryFilterChips({
    Key key,
    this.chipLabel,
  }) : super(key: key);

  @override
  _CategoryFilterChipsState createState() => _CategoryFilterChipsState();
}

class _CategoryFilterChipsState extends State<CategoryFilterChips> {
  bool _isSelected = false;

  void _switchSelectionState() {
    if (_isSelected == false) {
      setState(() {
        _isSelected = true;
      });
    } else {
      setState(() {
        _isSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        FilterChip(label: Text(widget.chipLabel), onSelected: null),
      ],
    );
  }
}

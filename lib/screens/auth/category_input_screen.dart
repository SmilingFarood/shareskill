import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareskill/providers/user_category.dart';

class CategoryInputScreen extends StatelessWidget {
  const CategoryInputScreen({Key key}) : super(key: key);
  static const routeName = '/category-input-screen';

  @override
  Widget build(BuildContext context) {
    final fourthStageReceivedData =
        ModalRoute.of(context).settings.arguments as dynamic;
    print('This is printed in the category Input screen');
    print(fourthStageReceivedData);
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
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  List<String> _selectedCat = [];
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<UserCategory>(context).categories;
    return Container(
      height: 400,
      width: 350,
      child: Card(
        elevation: 8,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 300,
              width: 300,
              child: Wrap(
                runSpacing: 3,
                spacing: 10,
                children: List.generate(
                  categoryData.length,
                  (index) {
                    return FilterChipClass(
                      labelUsed: categoryData[index].title,
                      color: categoryData[index].color,
                      allSelected: _selectedCat,
                    );
                  },
                ),
              ),
            ),
            RaisedButton(
              child: Text('Continue'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class FilterChipClass extends StatefulWidget {
  final String labelUsed;
  final Color color;
  final List<String> allSelected;
  FilterChipClass({
    this.labelUsed,
    this.color,
    @required this.allSelected,
  });

  @override
  _FilterChipClassState createState() => _FilterChipClassState();
}

class _FilterChipClassState extends State<FilterChipClass> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: widget.color,
      avatar: CircleAvatar(
        child: Text(
          widget.labelUsed[0].toUpperCase(),
        ),
      ),
      label: Text(widget.labelUsed),
      selected: _isSelected,
      onSelected: (_) {
        if (_isSelected == false) {
          setState(() {
            _isSelected = true;
            widget.allSelected.add(widget.labelUsed);
          });
        } else {
          setState(() {
            _isSelected = false;
            widget.allSelected.remove(widget.labelUsed);
          });
        }
      },
    );
  }
}

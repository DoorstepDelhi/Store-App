import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/widgets/ProductGridItemWidget.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  ProductsList list = ProductsList();
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        itemCount: list.list.length,
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        scrollDirection: Axis.vertical,
        staggeredTileBuilder: (ind) => StaggeredTile.count(
            (ind - 2).isOdd && (ind - 2) % 9 == 0 ? 2 : 1,
            (ind - 2) % 9 == 0 ? 2 : 1),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/Exploremore');
            },
            child: Container(
                color: Colors.green,
                child: new Center(
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text('$index'),
                  ),
                )),
          );
        });
  }
}

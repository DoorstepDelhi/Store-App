import 'package:flutter/material.dart';

import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/models/productDetails.dart';
import 'package:store_app/src/widgets/DrawerWidget.dart';
import 'package:store_app/src/widgets/FilterWidget.dart';
import 'package:store_app/src/widgets/ProductsListViewWidget.dart';
import 'package:store_app/src/widgets/SearchBarWidget.dart';
import 'package:store_app/src/widgets/ShoppingCartButtonWidget.dart';

import 'package:store_app/view/productdetailsviewmodel.dart';
import 'package:store_app/view/produts_viewmodel.dart';

import '../models/product.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String layout = 'list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      endDrawer: FilterWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'All Products',
          style: Theme.of(context).textTheme.display1,
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor,
              labelColor: Theme.of(context).accentColor),
          Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
              child: InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () {
                  Navigator.of(context).pushNamed('/Tabs', arguments: 4);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('img/user2.jpg'),
                ),
              )),
        ],
      ),
      body: BaseView<ProductsViewModel>(
        onModelReady: (model) => model.initdata(),
        builder: (ctx, model, child) {
          print('building');
          return model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  controller: model.scrollController,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SearchBarWidget(),
                      ),
                      SizedBox(height: 10),
                      Offstage(
                        offstage: model.initData.isEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            leading: Icon(
                              UiIcons.heart,
                              color: Theme.of(context).hintColor,
                            ),
                            title: Text(
                              'All Products',
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Theme.of(context).textTheme.display1,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      this.layout = 'list';
                                    });
                                  },
                                  icon: Icon(
                                    Icons.format_list_bulleted,
                                    color: this.layout == 'list'
                                        ? Theme.of(context).accentColor
                                        : Theme.of(context).focusColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      this.layout = 'grid';
                                    });
                                  },
                                  icon: Icon(
                                    Icons.apps,
                                    color: this.layout == 'grid'
                                        ? Theme.of(context).accentColor
                                        : Theme.of(context).focusColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage:
                            this.layout != 'list' || model.initData.isEmpty,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: false,
                          //ask
                          itemCount: model.initData.length + 1,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            if (model.initData.length == index) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ProductsListViewWidget(
                              heroTag: 'products_list',
                              product: model.initData.elementAt(index),
                            );
                          },
                        ),
                      ),
                      //GridView
                      //                   Offstage(
                      //                     offstage: this.layout != 'grid' || model.wishList.isEmpty,
                      //                     child: Container(
                      //                       padding: EdgeInsets.symmetric(horizontal: 20),
                      //                       child: new StaggeredGridView.countBuilder(
                      //                         primary: false,
                      //                         shrinkWrap: true,
                      //                         crossAxisCount: 4,
                      //                         itemCount: model.wishList.length,
                      //                         itemBuilder: (BuildContext context, int index) {
                      //                           Product product =
                      //                               model.wishList.elementAt(index).product;
                      //                           return ProductGridItemWidget(
                      //                             product: product,
                      //                             heroTag: 'favorites_grid',
                      //                           );
                      //                         },
                      // //                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                      //                         staggeredTileBuilder: (int index) =>
                      //                             new StaggeredTile.fit(2),
                      //                         mainAxisSpacing: 15.0,
                      //                         crossAxisSpacing: 15.0,
                      //                       ),
                      //                     ),
                      //                   ),
                      //prodcts cant be deleted
                      // Offstage(
                      //   offstage: model.wishList.isNotEmpty,
                      //   child: EmptyFavoritesWidget(),
                      // )
                    ],
                  ),
                );
        },
      ),
    );
  }
}

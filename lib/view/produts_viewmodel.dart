import 'package:flutter/material.dart';

import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api-response.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/models/wishList.dart';

class ProductsViewModel extends BaseModel {
  List<Product> initData = [];
  ScrollController scrollController = ScrollController();
  int count = 0;
  int nextUrl = 0;
  bool fetching = false;

  ApiService _apiService = ApiService();

  void initdata() async {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getProducts();
      }
    });
    if (initData.isEmpty) {
      setState(viewState: ViewState.Busy);
      count = await getProducts();
      setState(viewState: ViewState.Idle);
      print(count);
    }
    ;
  }

  Future<int> getProducts() async {
    print(initData);
    ApiResponse response;
    print(nextUrl);

    if (nextUrl <= count) {
      setState();
      fetching = true;
      response = await _apiService.getPagiProducts(nextUrl.toString());
      nextUrl += 10;
      if (!response.error) {
        // initData = [];
        for (var res in response.data['results']) {
          Product model = Product.fromJson(res);
          initData.add(model);
        }
        print(initData);
        fetching = false;
        setState();
        return response.data['count'];
      } else {
        print(response.errorMessage);
      }
    }
    return 100;
  }
}

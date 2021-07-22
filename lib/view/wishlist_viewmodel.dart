import 'package:flutter/material.dart';
import 'package:store_app/constant/appconstant.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/models/wishList.dart';

class WishListViewModel extends BaseModel {
  WishList initData;

  ApiService _apiService = ApiService();
  void getWishlist(BuildContext context) async {
    setState(viewState: ViewState.Busy);
    final response = await _apiService.getWishlist();
    if (!response.error) {
      setState(viewState: ViewState.Idle);
      print(response.data);
      initData = WishList.fromJson(response.data);

      // print(checkedWebsite);

    } else {
      // setState(viewState: ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      // AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}

import 'dart:async';

import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/brand.dart';
import 'package:store_app/src/models/category.dart';
import 'package:store_app/src/models/product.dart';

class HomeViewModel extends BaseModel {
  ApiService _apiService = ApiService();

  List<Category> categories = [];
  List<Brand> brands = [];
  CategoriesList categoriesList = CategoriesList();
  BrandsList brandsList = BrandsList();
  List<Product> productsOfCategoryList;
  List<Product> productsOfBrandsList;

  bool categoriesFetched = false;
  bool brandsFetched = false;

  void fetchInitData() async {
    if (brands.isEmpty && categories.isEmpty)
      fetchBrands().whenComplete(() {
        brandsFetched = false;
        setState();
      });
    fetchCategories().whenComplete(() {
      categoriesFetched = false;
      setState();
    });
  }

  Future<List<Category>> fetchCategories() async {
    if (categories.isEmpty) {
      // setState(ViewState.Busy);
      categoriesFetched = true;
      final categoryResponse = await _apiService.getCategories();
      categories = [];
      if (!categoryResponse.error) {
        for (var x in categoryResponse.data) {
          Category category = Category.fromJson(x);
          categories.add(category);
        }
        productsOfCategoryList = categories.first.products;
        categoriesList.list = categories;
      } else {
        print('error in line 44: ' + categoryResponse.errorMessage);
      }
    }
    return categories;

    // categoriesFetched = true;
  }

  Future<List<Brand>> fetchBrands() async {
    if (brands.isEmpty) {
      print(brands);
      // setState(ViewState.Busy);
      brandsFetched = true;
      final brandResponse = await _apiService.getBrands();
      brands = [];
      if (!brandResponse.error) {
        for (var x in brandResponse.data) {
          Brand brand = Brand.fromJson(x);
          brands.add(brand);
        }
        productsOfBrandsList = brands.first.products;
        brandsList.list = brands;
      } else {
        print('error in line 60: ' + brandResponse.errorMessage);
      }
    }

    return brands;

    // brandsFetched = true;
  }
}

import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/brand.dart';
import 'package:store_app/src/models/category.dart';

class HomeViewModel extends BaseModel {
  ApiService _apiService = ApiService();

  List<Category> categories = [];
  List<Brand> brands = [];

  void fetchInitData() async {
    setState(ViewState.Busy);
    print('start time:' + DateTime.now().millisecond.toString());
    final data = await Future.wait(
        [_apiService.getCategories(), _apiService.getBrands()]);
    print('end time:' + DateTime.now().millisecond.toString());

    print(data[0].data);
    setState(ViewState.Idle);
  }
}

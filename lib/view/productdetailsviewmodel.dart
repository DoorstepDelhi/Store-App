import 'package:http/http.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/groupConversation.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/models/productDetails.dart';
import 'package:store_app/view/groupChatViewModel.dart';

class ProductDetailsViewmodel extends BaseModel {
  ApiService _apiService = ApiService();
  Product product;
  var groups = getIt.get<GroupChatViewModel>().groupConversations;
  List<GroupConversation> get() => groups;
  void initData(String id) async {
    print(groups);
    setState(viewState: ViewState.Busy);
    final respone = await _apiService.fetchProdyuct(id: id);
    print(respone.data);
    product = Product.fromJsonDetail(respone.data);

    setState(viewState: ViewState.Idle);
  }

  Future<List<GroupConversation>> fetchgroupList() async {
    if (groups.isEmpty) {
      final response = await _apiService.getGroupChat();

      if (!response.error) {
        print(response.data);
        groups = [];
        for (var res in response.data) {
          GroupConversation model = GroupConversation.fromJson(res);
          groups.add(model);
        }
      } else {
        print('error in group chat view model: ' + response.errorMessage);
      }
    }
    return groups;
  }
  // List<GroupConversation> searchGroups(){
  //   groups=[];

  //   return
  // }
  void addToWishList(bool mywishlist, List<String> selectedGroups) async {
    String string = '';
    for (String str in selectedGroups) {
      string = string + ',' + str;
    }
    print(string);
    if (mywishlist) {
      print(' in 61');
      final response = await _apiService.addToWishlist(
          id: product.id,
          data: {"user": mywishlist.toString(), "groups": string});
      if (!response.error) {
        print(response.data);
      } else {
        print(response.errorMessage);
      }
    } else {
      final response = await _apiService
          .addToWishlist(id: product.id, data: {"groups": string});
      if (!response.error) {
        print(response.data);
      }
    }
    // if (!response.error) {
    //   print(response.data);
    // }
  }
}

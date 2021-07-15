import 'package:store_app/services/api-response.dart';
import 'package:store_app/services/api_urls.dart';
import 'package:store_app/services/base_api.dart';

class ApiService extends BaseApi {
  // Login ViewModel
  Future<ApiResponse> signupMethod(data) async {
    ApiResponse response;
    try {
      response = await signUp(data, eSignUp);
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> loginMethod(data) async {
    ApiResponse response;
    try {
      response = await signUp(data, eLogIn);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  // HomeViewModel
  Future<ApiResponse> getCategories() async {
    ApiResponse response;
    try {
      response = await getWithoutAuthRequest(
        endpoint: homecategories,
      );
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }

  Future<ApiResponse> getBrands() async {
    ApiResponse response;
    try {
      response = await getWithoutAuthRequest(
        endpoint: homebrands,
      );
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }

  // Address View Model
  Future<ApiResponse> getAddressMethod({String endpoint}) async {
    ApiResponse response;
    try {
      response = await getRequest(endpoint: endpoint);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> postAddressMethod(
      {String endpoint, Map<String, dynamic> data}) async {
    ApiResponse response;
    try {
      response = await postRequest(endpoint, data);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> patchAddressMethod(
      {String endpoint, Map<String, dynamic> data}) async {
    ApiResponse response;
    try {
      response = await patchRequest(endpoint, data);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }

  Future<ApiResponse> deleteAddressMethod({String endpoint, String id}) async {
    ApiResponse response;
    try {
      response = await deleteRequest(endpoint: endpoint, id: id);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }
}

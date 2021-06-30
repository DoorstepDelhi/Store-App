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
        endpoint: categories,
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
        endpoint: brands,
      );
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }
}

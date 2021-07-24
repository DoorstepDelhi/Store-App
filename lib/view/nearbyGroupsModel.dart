import 'package:flutter/material.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/src/models/nearbyGroups.dart';

class NearbyGroupsViewModel extends BaseModel {
  ApiService _apiService = ApiService();

  List<NearbyGroups> nearbyGroupsList = [];

  void getNearbyGroups(BuildContext context) async {
    if (nearbyGroupsList.isEmpty) {
      setState(viewState: ViewState.Busy);

      final response = await _apiService.getNearbyGroups();

      if (!response.error) {
        setState(viewState: ViewState.Idle);
        print(response.data);
        nearbyGroupsList = [];
        for (var res in response.data) {
          NearbyGroups model = NearbyGroups.fromJson(res);
          nearbyGroupsList.add(model);
        }
      } else {
        print('error in nearby group view model: ' + response.errorMessage);
      }
    }
  }
}

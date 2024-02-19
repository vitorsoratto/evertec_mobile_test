import 'package:evertec_mobile_test/app/modules/details/models/state_detail.dart';
import 'package:evertec_mobile_test/app/shared/http/app_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StateInfoRepository {
  AppDio appDio = Modular.get<AppDio>();

  Future<StateDetailModel?> getStateInfo(String state) async {
    if (state.isEmpty) {
      return null;
    }

    final response =
        await appDio.get('states/${state.toLowerCase()}/info.json');

    if (response.statusCode != 200) {
      return null;
    }
    return StateDetailModel.fromJson(response.data);
  }
}

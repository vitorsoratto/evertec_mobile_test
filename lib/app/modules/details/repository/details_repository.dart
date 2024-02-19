import 'package:evertec_mobile_test/app/modules/details/models/state_current.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_info.dart';
import 'package:evertec_mobile_test/app/shared/http/app_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsRepository {
  AppDio appDio = Modular.get<AppDio>();

  Future<List<StateInfoModel>?> getStateInfo() async {
    final response = await appDio.get('states/info.json');

    if (response.statusCode != 200) {
      return null;
    }
    return List<StateInfoModel>.from(
        response.data.map((x) => StateInfoModel.fromJson(x)));
  }

  Future<List<StateCurrentModel>?> getStateCurrent() async {
    final response = await appDio.get('states/current.json');

    if (response.statusCode != 200) {
      return null;
    }
    return List<StateCurrentModel>.from(
        response.data.map((x) => StateCurrentModel.fromJson(x)));
  }
}

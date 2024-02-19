import 'package:evertec_mobile_test/app/modules/home/models/current_model.dart';
import 'package:evertec_mobile_test/app/shared/http/app_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeRepository {
  AppDio appDio = Modular.get<AppDio>();

  Future<CurrentModel?> getCurrentData() async {
    final response = await appDio.get('us/current.json');

    if (response.statusCode != 200) {
      return null;
    }
    return CurrentModel.fromJson(response.data[0]);
  }
}

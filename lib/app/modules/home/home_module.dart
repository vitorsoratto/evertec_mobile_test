import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/modules/home/bloc/home_bloc.dart';
import 'package:evertec_mobile_test/app/modules/home/home_view.dart';
import 'package:evertec_mobile_test/app/modules/home/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add(HomeBloc.new);
    i.add(HomeRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) {
        final AppBloc appBloc = Modular.get<AppBloc>();
        final HomeBloc homeBloc = Modular.get<HomeBloc>();
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: appBloc),
            BlocProvider.value(value: homeBloc),
          ],
          child: const HomeView(),
        );
      },
    );
  }
}

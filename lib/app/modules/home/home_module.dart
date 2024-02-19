import 'package:evertec_mobile_test/app/modules/bloc/app_bloc.dart';
import 'package:evertec_mobile_test/app/modules/home/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) {
        final AppBloc appBloc = Modular.get<AppBloc>();
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: appBloc)],
          child: const HomeView(),
        );
      },
    );
  }
}

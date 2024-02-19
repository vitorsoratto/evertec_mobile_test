import 'package:evertec_mobile_test/app/modules/details/bloc/details_bloc.dart';
import 'package:evertec_mobile_test/app/modules/details/details_view.dart';
import 'package:evertec_mobile_test/app/modules/details/repository/details_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends Module {
  @override
  void binds(i) {
    i.add(DetailsRepository.new);
    i.add(DetailsBloc.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) {
        return const DetailsView();
      },
    );
  }
}

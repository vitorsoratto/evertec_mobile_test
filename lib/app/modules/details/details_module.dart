import 'package:evertec_mobile_test/app/modules/details/bloc/details_bloc.dart';
import 'package:evertec_mobile_test/app/modules/details/details_view.dart';
import 'package:evertec_mobile_test/app/modules/details/repository/details_repository.dart';
import 'package:evertec_mobile_test/app/modules/details/state/bloc/state_info_bloc.dart';
import 'package:evertec_mobile_test/app/modules/details/state/repository/state_info_repository.dart';
import 'package:evertec_mobile_test/app/modules/details/state/state_detail_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends Module {
  @override
  void binds(i) {
    i.add(DetailsRepository.new);
    i.add(DetailsBloc.new);
    i.add(StateInfoBloc.new);
    i.add(StateInfoRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) {
        return const DetailsView();
      },
    );
    r.child(
      '/state/',
      child: (_) => StateDetailView(
        stateDetail: r.args.data,
      ),
    );
  }
}

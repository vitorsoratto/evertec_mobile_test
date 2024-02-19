import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_current.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_info.dart';
import 'package:evertec_mobile_test/app/modules/details/repository/details_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<Current>(_onCurrent);
  }

  void _onCurrent(Current event, Emitter<DetailsState> emit) async {
    List<StateCurrentModel>? stateCurrentModel;
    List<StateInfoModel>? stateInfoModel;

    DetailsRepository detailsRepository = Modular.get<DetailsRepository>();

    stateCurrentModel = await detailsRepository.getStateCurrent();
    stateInfoModel = await detailsRepository.getStateInfo();

    if (stateCurrentModel != null && stateInfoModel != null) {
      emit(
        DetailsSuccess(
            stateCurrentModel: stateCurrentModel,
            stateInfoModel: stateInfoModel),
      );
    } else {
      emit(DetailsFailed());
    }
  }
}

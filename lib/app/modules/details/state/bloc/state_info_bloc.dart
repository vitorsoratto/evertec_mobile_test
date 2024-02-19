import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_detail.dart';
import 'package:evertec_mobile_test/app/modules/details/state/repository/state_info_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'state_info_event.dart';
part 'state_info_state.dart';

class StateInfoBloc extends Bloc<StateInfoEvent, StateInfoState> {
  StateInfoBloc() : super(StateInfoInitial()) {
    on<StateSearch>(_onCurrent);
  }

  void _onCurrent(StateSearch event, Emitter<StateInfoState> emit) async {
    StateDetailModel? stateDetailModel;

    StateInfoRepository stateInfoRepository =
        Modular.get<StateInfoRepository>();

    stateDetailModel = await stateInfoRepository
        .getStateInfo(event.stateDetailModel.state ?? '');

    stateDetailModel?.stateCurrent = event.stateDetailModel.stateCurrent;
    stateDetailModel?.stateInfo = event.stateDetailModel.stateInfo;

    if (stateDetailModel != null) {
      emit(
        StateInfoSuccess(stateDetailModel: stateDetailModel),
      );
    } else {
      emit(StateInfoFailed());
    }
  }
}

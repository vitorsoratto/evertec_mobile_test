import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evertec_mobile_test/app/modules/home/models/current_model.dart';
import 'package:evertec_mobile_test/app/modules/home/repository/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<Current>(_onCurrent);
  }

  void _onCurrent(Current event, Emitter<HomeState> emit) async {
    CurrentModel? currentModel;

    HomeRepository homeRepository = Modular.get<HomeRepository>();

    currentModel = await homeRepository.getCurrentData();

    if (currentModel != null) {
      emit(HomeSuccess(currentModel: currentModel));
    } else {
      emit(HomeFailed());
    }
  }
}

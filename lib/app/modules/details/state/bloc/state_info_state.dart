part of 'state_info_bloc.dart';

abstract class StateInfoState extends Equatable {
  const StateInfoState();

  @override
  List<Object?> get props => [];
}

class StateInfoInitial extends StateInfoState {}

class StateInfoSuccess extends StateInfoState {
  final StateDetailModel stateDetailModel;

  const StateInfoSuccess({required this.stateDetailModel});

  @override
  List<Object> get props => [stateDetailModel];
}

class StateInfoFailed extends StateInfoState {}

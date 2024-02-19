part of 'state_info_bloc.dart';

class StateInfoEvent extends Equatable {
  const StateInfoEvent();

  @override
  List<Object> get props => [];
}

class StateSearch extends StateInfoEvent {
  final StateDetailModel stateDetailModel;

  const StateSearch({required this.stateDetailModel});

  @override
  List<Object> get props => [stateDetailModel];
}

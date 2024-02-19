part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final List<StateCurrentModel> stateCurrentModel;
  final List<StateInfoModel> stateInfoModel;

  const DetailsSuccess(
      {required this.stateCurrentModel, required this.stateInfoModel});

  @override
  List<Object> get props => [stateCurrentModel, stateInfoModel];
}

class DetailsFailed extends DetailsState {}

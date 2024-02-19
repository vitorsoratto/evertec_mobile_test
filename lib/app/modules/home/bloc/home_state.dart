part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final CurrentModel currentModel;

  const HomeSuccess({required this.currentModel});

  @override
  List<Object> get props => [currentModel];
}

class HomeFailed extends HomeState {}

part of 'home_bloc.dart';

final class HomeState extends Equatable {
  final DeviceInfoPlugin deviceInfoPlugin;

  const HomeState({
    required this.deviceInfoPlugin,
  });

  HomeState copyWith({
    required DeviceInfoPlugin deviceInfoPlugin,
  }) {
    return HomeState(
      deviceInfoPlugin: deviceInfoPlugin,
    );
  }

  @override
  List<Object> get props => [deviceInfoPlugin];
}

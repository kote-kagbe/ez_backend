part of 'app_config_bloc.dart';

@immutable
sealed class AppConfigEvent extends Equatable {
  const AppConfigEvent();
}

class AppConfigUpdate extends AppConfigEvent {
  @override
  List<Object> get props => [];
}

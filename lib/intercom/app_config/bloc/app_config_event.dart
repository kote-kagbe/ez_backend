part of 'app_config_bloc.dart';

@immutable
sealed class AppConfigEvent extends Equatable {
  const AppConfigEvent();
}

class AppConfigUpdate extends AppConfigEvent {
  const AppConfigUpdate({this.configPath, this.resetColorScheme = false});

  final String? configPath;
  final bool resetColorScheme;

  @override
  List<Object> get props => [];
}

part of 'app_config_bloc.dart';

@immutable
sealed class AppConfigEvent extends Equatable {
  const AppConfigEvent({this.configPath});

  final String? configPath;
}

class AppConfigUpdate extends AppConfigEvent {
  const AppConfigUpdate({super.configPath});

  @override
  List<Object> get props => [];
}

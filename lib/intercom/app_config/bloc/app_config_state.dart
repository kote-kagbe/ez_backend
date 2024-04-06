part of 'app_config_bloc.dart';

@immutable
sealed class AppConfigStateBase extends Equatable {
  const AppConfigStateBase();
}

enum AppConfigStateValue {
  init,
  ready,
  error,
}

final class AppConfigState extends AppConfigStateBase {
  const AppConfigState(this._value);

  final AppConfigStateValue _value;

  AppConfigStateValue get value => _value;

  @override
  List<Object> get props => [_value];
}

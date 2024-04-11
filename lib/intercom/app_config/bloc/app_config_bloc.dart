import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ez_backend/intercom/app_config/app_config.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final AppConfig config;

  AppConfigBloc({required this.config})
      : super(const AppConfigState(AppConfigStateValue.ready)) {
    on<AppConfigUpdate>((event, Emitter emit) async {
      emit(const AppConfigState(AppConfigStateValue.init));
      return config.update().then((result) {
        if (result) {
          emit(const AppConfigState(AppConfigStateValue.ready));
        }
      }, onError: (_) {
        emit(const AppConfigState(AppConfigStateValue.error));
      });
    });
  }
}

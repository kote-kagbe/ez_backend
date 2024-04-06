import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ez_backend/intercom/app_config/app_config.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final AppConfig config;

  AppConfigBloc({required this.config})
      : super(const AppConfigState(AppConfigStateValue.init)) {
    on<AppConfigUpdate>((event, emit) async {
      // почему-то внутри обработчика должен быть только синхронный код, подписка на Future не работает
      emit(const AppConfigState(AppConfigStateValue.init));
      if (await config.update() == true) {
        emit(const AppConfigState(AppConfigStateValue.ready));
      }
      // config.update().then((result) {
      //   if (result) {
      //     emit(const AppConfigState(AppConfigStateValue.ready));
      //   }
      // }, onError: (_) {
      //   emit(const AppConfigState(AppConfigStateValue.error));
      // });
    });
  }
}

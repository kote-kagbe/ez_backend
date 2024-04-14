import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stand_card_event.dart';
part 'stand_card_state.dart';

class StandCardBloc extends Bloc<StandCardEvent, StandCardState> {
  StandCardBloc() : super(StandCardInitial()) {
    on<StandCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

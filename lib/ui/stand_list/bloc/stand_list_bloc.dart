import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stand_list_event.dart';
part 'stand_list_state.dart';

class StandListBloc extends Bloc<StandListEvent, StandListState> {
  StandListBloc() : super(StandListInitial()) {
    on<StandListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

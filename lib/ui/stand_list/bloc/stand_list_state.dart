part of 'stand_list_bloc.dart';

sealed class StandListState extends Equatable {
  const StandListState();
}

final class StandListInitial extends StandListState {
  @override
  List<Object> get props => [];
}

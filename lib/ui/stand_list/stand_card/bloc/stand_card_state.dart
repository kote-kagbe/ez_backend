part of 'stand_card_bloc.dart';

sealed class StandCardState extends Equatable {
  const StandCardState();
}

final class StandCardInitial extends StandCardState {
  @override
  List<Object> get props => [];
}

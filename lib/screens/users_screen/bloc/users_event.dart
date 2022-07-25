part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UsersEvent {
  final int from;
  final bool isFirstCall;

  const GetUsersEvent({required this.from, this.isFirstCall = false});
}

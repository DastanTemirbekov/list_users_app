part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class GetUsersLoadingState extends UsersState {}

class GetUsersLoadedState extends UsersState {
  final List<UsersModel> model;

  const GetUsersLoadedState({required this.model});

  @override
  List<Object> get props => [model];
}

class GetUsersErrorState extends UsersState {
  final CatchException error;

  const GetUsersErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

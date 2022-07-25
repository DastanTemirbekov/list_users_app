part of 'user_detail_bloc.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class GetUserDetailLoadingState extends UserDetailState {}

class GetUserDetailLoadedState extends UserDetailState {
  final UserDetailModel model;

  const GetUserDetailLoadedState({required this.model});

  @override
  List<Object> get props => [model];
}

class GetUserDetailErrorState extends UserDetailState {
  final CatchException error;

  const GetUserDetailErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

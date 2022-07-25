import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:list_users_app/helpers/catch_exceptions.dart';
import 'package:list_users_app/models/user_detail_model.dart';
import 'package:list_users_app/screens/user_detail_screen/bloc/user_detail_repository.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc() : super(UserDetailInitial()) {
    UserDetailRepository repository = UserDetailRepository();

    on<GetUserDetailEvent>((event, emit) async {
      emit(GetUserDetailLoadingState());

      try {
        UserDetailModel usersModel =
            await repository.getSingleUser(username: event.username);

        emit(GetUserDetailLoadedState(model: usersModel));
      } catch (e) {
        emit(
            GetUserDetailErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}

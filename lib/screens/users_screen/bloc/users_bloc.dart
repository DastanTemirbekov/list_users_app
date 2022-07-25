import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:list_users_app/helpers/catch_exceptions.dart';
import 'package:list_users_app/models/users_model.dart';
import 'package:list_users_app/screens/users_screen/bloc/users_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    UsersRepository repository = UsersRepository();

    on<GetUsersEvent>((event, emit) async {
      if (event.isFirstCall == true) {
        emit(GetUsersLoadingState());
      }

      try {
        List<UsersModel> usersModelList =
            await repository.getAllUsers(from: event.from);

        emit(GetUsersLoadedState(model: usersModelList));
      } catch (e) {
        emit(GetUsersErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}

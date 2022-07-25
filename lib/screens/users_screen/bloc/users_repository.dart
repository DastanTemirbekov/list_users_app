import 'package:list_users_app/models/users_model.dart';
import 'package:list_users_app/screens/users_screen/bloc/users_provider.dart';

class UsersRepository {
  Future<List<UsersModel>> getAllUsers({required int from}) {
    UsersProvider provider = UsersProvider();

    return provider.getAllUsers(from);
  }
}

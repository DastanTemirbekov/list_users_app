import 'package:list_users_app/models/user_detail_model.dart';
import 'package:list_users_app/screens/user_detail_screen/bloc/user_detail_provider.dart';

class UserDetailRepository {
  Future<UserDetailModel> getSingleUser({required String username}) {
    UserDetailProvider provider = UserDetailProvider();

    return provider.getSingleUser(username);
  }
}

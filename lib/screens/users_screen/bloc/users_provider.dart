import 'package:dio/dio.dart';
import 'package:list_users_app/helpers/api_requester.dart';
import 'package:list_users_app/helpers/catch_exceptions.dart';
import 'package:list_users_app/models/users_model.dart';

class UsersProvider {
  Future<List<UsersModel>> getAllUsers(int from) async {
    try {
      ApiRequester requester = ApiRequester();

      Response response =
          await requester.toGet("users?since=$from&per_page=10");
      if (response.statusCode == 200) {
        return response.data
            .map<UsersModel>((val) => UsersModel.fromJson(val))
            .toList();
      }

      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}

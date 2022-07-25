import 'package:dio/dio.dart';
import 'package:list_users_app/helpers/api_requester.dart';
import 'package:list_users_app/helpers/catch_exceptions.dart';
import 'package:list_users_app/models/user_detail_model.dart';

class UserDetailProvider {
  Future<UserDetailModel> getSingleUser(String username) async {
    try {
      ApiRequester requester = ApiRequester();

      Response response = await requester.toGet("users/$username");
      if (response.statusCode == 200) {
        return UserDetailModel.fromJson(response.data);
      }

      throw CatchException.convertException(response);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}

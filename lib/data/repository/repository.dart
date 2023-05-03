import 'package:retrofit/dio.dart';
import 'package:retrofitapi/data/api_handling/api_result.dart';
import 'package:retrofitapi/data/api_handling/network_exceptions.dart';
import 'package:retrofitapi/data/model/user_model.dart';
import 'package:retrofitapi/data/web_services/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<ApiResult<List<User>>> getAllUser() async {
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<User>> getUserById(String userId) async {
    try {
      var response = await webServices.getUserById(userId);
      return ApiResult.success(response);
    }
    catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.createNewUser(newUser,
          'Bearer 266011b7625eba47bb22d916cc895be80d09523c732855d150f2852347bda0ad');
      return ApiResult.success(response);
    }
    catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<HttpResponse> deleteUser(String userId) async {
    return await webServices.deleteUser(userId,
        'Bearer 266011b7625eba47bb22d916cc895be80d09523c732855d150f2852347bda0ad');
  }
}

import 'package:dio/dio.dart';
import 'package:excel_hrm/features/authentication/data/datasource/remote/dio/dio_client.dart';
import 'package:excel_hrm/features/authentication/data/datasource/remote/exception/api_error_handler.dart';
import 'package:excel_hrm/features/authentication/data/model/base/api_response.dart';
import 'package:excel_hrm/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  AuthRepo({ this.dioClient,  this.sharedPreferences});

  Future<ApiResponse> login(dynamic email, dynamic password) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.LOGIN_URI,
        data: {
          "email" : email,
          "password" : password
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }




}

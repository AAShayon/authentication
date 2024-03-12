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
      saveUserToken(response.data["user"]["token"]);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /// For Social Login
  Future<ApiResponse> socialLogin() async {
    try {
      Response response = await dioClient!.post(
        "",
        data: "",
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /// For Log Out
  Future<ApiResponse> logOut() async {
    try {
      Response response = await dioClient!.post(
        AppConstants.LOGOUT_URI,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /// For save user token
  Future<void> saveUserToken(String token) async {
    dioClient!.updateHeader(token, null);
    try {
      await sharedPreferences!.setString(AppConstants.TOKEN, token);
      print("========>Token Stored<=======");
      print(await sharedPreferences!.getString(AppConstants.TOKEN));
    } catch (e) {
      throw e;
    }
  }

  ///save user token in local storage
  getUserToken() {
    SharedPreferences.getInstance();
    return sharedPreferences!.getString(AppConstants.TOKEN) ?? "";
  }
  /// remove user token from local storage
  removeUserToken() async{
    await SharedPreferences.getInstance();
    return sharedPreferences!.remove(AppConstants.TOKEN);
  }
  /// for save auth token
  Future<void> saveAuthToken(String token) async {
    dioClient!.token = token;
    dioClient!.dio!
        .options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences!.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }
  String getAuthToken() {
    return sharedPreferences!.getString(AppConstants.TOKEN) ?? "";
  }
  bool isLoggedIn() {
    return sharedPreferences!.containsKey(AppConstants.TOKEN);
  }
  /// For clear sharedPreference data
  Future<bool> clearSharedData() async {
    sharedPreferences!.remove(AppConstants.CURRENCY);
    sharedPreferences!.remove(AppConstants.TOKEN);
    sharedPreferences!.remove(AppConstants.USER);
    //FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    return true;
  }
  /// For reset password
  Future<ApiResponse> resetPassword(String identity, String otp ,String password, String confirmPassword) async {
    print('======Password====>$password');
    try {
      Response response = await dioClient!.post(
          AppConstants.RESET_PASSWORD_URI, data: {"_method" : "put", "identity": identity.trim(), "otp": otp,"password": password, "confirm_password":confirmPassword});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  /// for  Remember Email and Password
  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences!.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences!.setString(AppConstants.USER_EMAIL, email);
    } catch (e) {
      throw e;
    }
  }
  /// Get user email
  String getUserEmail() {
    return sharedPreferences!.getString(AppConstants.USER_EMAIL) ?? "";
  }

  /// Get user password
  String getUserPassword() {
    return sharedPreferences!.getString(AppConstants.USER_PASSWORD) ?? "";
  }
  /// for clear user email and password
  Future<bool> clearUserEmailAndPassword() async {
    await sharedPreferences!.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences!.remove(AppConstants.USER_EMAIL);
  }
  /// For forget password
  Future<ApiResponse> forgetPassword(dynamic number) async {
    try {
      Response response = await dioClient!.post(AppConstants.FORGET_PASSWORD_URI+number);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}

import 'package:dio/dio.dart';
import 'package:e_ticket_app/core/api_service/helper/failure.dart';
import 'package:e_ticket_app/core/app_utils/utils.dart';
import 'package:e_ticket_app/core/data_service/hive/hive.dart';
import 'package:e_ticket_app/modules/auth/domain/model/user_model.dart';
import 'package:e_ticket_app/modules/auth/domain/repository/auth_end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:e_ticket_app/modules/auth/domain/request/login_request_model.dart';
// login 
class AuthRepo with AuthEndPoint {

 ` Future<Either<Failure, UserModel>> login({ required LoginRequestModel loginData}) async {
    try {
      final Response response = await Utils.dio()
          .post(url: AuthEndPoint.login, body: loginData.toJson());
      if (response.statusCode == 200) {
        if (response.data["status"] == "200") { 
          await HiveService.saveUserModel(UserModel.fromJson(response.data)) ; 
          return right(UserModel.fromJson(response.data));
        } else {
          return left(Failure(errorMessage: response.data["data"]));
        }
      } else {
        return left(Failure.defaultMessage());
      }
    } on DioException catch (ex) {
      return left(Failure.serverError(ex));
    } on Exception {
      return left(Failure.defaultMessage());
    }
  }`
}

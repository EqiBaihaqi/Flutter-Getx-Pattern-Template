import 'package:fpdart/fpdart.dart';

import '../commons/network/api_config.dart';
import '../commons/repository/repository_helper.dart';
import '../models/response_auth_login.dart';
import '../models/response_auth_manpower.dart';


abstract class AuthRepository {
  Future<Either<String, DataAuthLogin>> postLogin(params);
  Future<Either<String, ManpowerData>> postManpower({String? idManpower});



}

class AuthRepositoryImpl extends RepositoryHelper implements AuthRepository {
  @override
  Future<Either<String, DataAuthLogin>> postLogin(params) async {
    var dioCall = dioClient.postRequest(ApiConfig.authLogin, data: params);
    return callApi<DataAuthLogin>(
        api: dioCall, jsonCallback: (json) => DataAuthLogin.fromJson(json));
  }
  @override
  Future<Either<String, ManpowerData>> postManpower({String? idManpower}) async {
    var dioCall = dioClient.postRequest(ApiConfig.authManpower, data: {'idManpower': idManpower});
    return callApi<ManpowerData>(
        api: dioCall, jsonCallback: (json) => ManpowerData.fromJson(json));
  }

 

}

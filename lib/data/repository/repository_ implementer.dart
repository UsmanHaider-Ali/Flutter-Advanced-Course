import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/data_source/remote_data_source.dart';
import 'package:flutter_advanced_course/data/mapper/mapper.dart';
import 'package:flutter_advanced_course/data/network/error_handler.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/network_info.dart';
import 'package:flutter_advanced_course/data/request/request.dart';
import 'package:flutter_advanced_course/domain/model/model.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';

class RepositoryImplementer extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    final response = await _remoteDataSource.login(loginRequest);

    try {
      if (await _networkInfo.isConnected) {
        if (response.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(409, response.message ?? ResponseMessage.defaultError));
        }
      } else {
        return Left(DataSource.noInternetConnection.getFailure());
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/data_source/remote_data_source.dart';
import 'package:flutter_advanced_course/data/mapper/mapper.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/network_info.dart';
import 'package:flutter_advanced_course/data/request/request.dart';
import 'package:flutter_advanced_course/domain/model.dart';
import 'package:flutter_advanced_course/domain/repository.dart';

class RepositoryImplementer extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    final response = await _remoteDataSource.login(loginRequest);

    if (await _networkInfo.isConnected) {
      if (response.success == true) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(409, response.message ?? "We have a business logic error, please try again later."));
      }
    } else {
      return Left(Failure(501, "Please check your internet connection and try again."));
    }
  }
}

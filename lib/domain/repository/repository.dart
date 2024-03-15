import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/request/request.dart';
import 'package:flutter_advanced_course/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}

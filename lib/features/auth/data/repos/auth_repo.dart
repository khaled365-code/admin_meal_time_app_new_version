

import 'package:dartz/dartz.dart';

import '../../../../core/database/errors/error_model.dart';

abstract class AuthRepo
{

  Future<Either<ErrorModel,String>>adminLogin({required String email,required String password});


}
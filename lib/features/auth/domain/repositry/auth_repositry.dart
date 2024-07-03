import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failler.dart';

abstract interface class AuthRepositry {
  Future<Either<Failure,String>>loginWithEmailAndPassword(
      {
        required String email,
        required String password
      });

 Future<Either<Failure,String>>singUpWithEmailAndPassword(
      {
        required String name,
        required String email,
        required String password
      });

}
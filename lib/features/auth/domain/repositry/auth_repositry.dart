import 'package:blogflutter/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failler.dart';

abstract interface class AuthRepositry {
  Future<Either<Failure,User>>loginWithEmailAndPassword(
      {
        required String email,
        required String password
      });

 Future<Either<Failure,User>>singUpWithEmailAndPassword(
      {
        required String name,
        required String email,
        required String password
      });
 Future<Either<Failure,Unit>>currentUser();

}
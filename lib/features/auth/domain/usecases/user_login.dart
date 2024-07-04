import 'package:blogflutter/features/auth/domain/repositry/auth_repositry.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failler.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';

class UserLogin implements UseCase <User,UserLoginParams>{
  final AuthRepositry authRepositry;
  const UserLogin(this.authRepositry);
  @override
  Future<Either<Failure,User>> call(UserLoginParams params)async {
  return authRepositry.loginWithEmailAndPassword(
      email: params.email , password: params.password
  );
  }
}



class UserLoginParams{
  final String email;
  final String password;
  UserLoginParams({
    required this.email,
    required this.password,
  });
}
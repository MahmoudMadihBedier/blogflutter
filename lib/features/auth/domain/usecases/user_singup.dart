import 'package:blogflutter/core/error/failler.dart';
import 'package:blogflutter/core/usecase/usecase.dart';
import 'package:blogflutter/features/auth/domain/entities/user.dart';
import 'package:blogflutter/features/auth/domain/repositry/auth_repositry.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<User,UserSingUpParams>{
  final AuthRepositry authRepositry;
  const UserSignUp(this.authRepositry);
  @override
  Future<Either<Failure, User>> call(param) async{
   return await authRepositry.singUpWithEmailAndPassword(
        name: param.name,
        email: param.email,
        password: param.password);

  }

}
class UserSingUpParams{
  final String name;
  final String email;
  final String password;
  UserSingUpParams({
    required this.name,
    required this.email,
    required this.password
  });
}
  

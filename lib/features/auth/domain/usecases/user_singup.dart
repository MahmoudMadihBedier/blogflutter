import 'package:blogflutter/core/error/failler.dart';
import 'package:blogflutter/core/usecase/usecase.dart';
import 'package:blogflutter/features/auth/domain/repositry/auth_repositry.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/common/entities/user.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
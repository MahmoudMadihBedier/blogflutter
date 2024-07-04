

import 'package:blogflutter/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failler.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositry/auth_repositry.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepositry authRepositry;
  CurrentUser(this.authRepositry);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepositry.currentUser();
  }
}

import 'package:blogflutter/core/error/failler.dart';
import 'package:blogflutter/features/auth/domain/repositry/auth_repositry.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/error/exceptions.dart';
import '../data_sourses/data_sourse.dart';

class AuthRepositroyImp implements AuthRepositry{
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositroyImp(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword({
    required String email, required String password}) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> singUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async{
    try{
      final userId = await remoteDataSource.singUpWithEmailAndPassword(
          name: name,
          email: email,
          password: password
      );

      return right(userId);

    }
   on ServerException catch(e){
      return left(Failure(e.message));


    }
  }
  
}
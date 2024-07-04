import 'package:blogflutter/core/error/failler.dart';
import 'package:blogflutter/features/auth/domain/entities/user.dart';
import 'package:blogflutter/features/auth/domain/repositry/auth_repositry.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../../../../core/error/exceptions.dart';
import '../data_sourses/auth_remote_data_sourse.dart';

class AuthRepositroyImp implements AuthRepositry{
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositroyImp(this.remoteDataSource);

  @override
  Future<Either<Failure, Unit>> currentUser() async{
    try{
      final user = await remoteDataSource.getCurrentUserData();
      if(user == null){
        return left(Failure("User not logged In !! "));
      }
      ///////////////////////////////////////////////
      return right ( user as Unit );
      //////////////////3:37:33////////////////////////////
    }on ServerException catch(e){
      return left(Failure(e.message));

    }

  }

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password
  })async {
   return _getUser(() async=> await

   remoteDataSource.loginWithEmailAndPassword(
       email: email,
       password: password
   ),
   );
  }

  @override
  Future<Either<Failure, User>> singUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async{
      return _getUser(() async=> await

      remoteDataSource.singUpWithEmailAndPassword(
          name: name,
          email: email,
          password: password
      ),
      );


  }
  Future<Either<Failure,User>> _getUser(
      Future<User>Function() fn,
      )async{
    try{
      final user = await fn();

      return right(user);

    }
    on sb.AuthException catch(e) {
      return left(Failure(e.message));
    } on ServerException catch(e){
      return left(Failure(e.message));


    }

  }


  
}
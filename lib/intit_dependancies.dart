import 'package:blogflutter/features/auth/domain/repositry/auth_repositry.dart';
import 'package:blogflutter/features/auth/domain/usecases/user_login.dart';
import 'package:blogflutter/features/auth/presention/bloc_auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/secrets/secrets.dart';
import 'features/auth/data/data_sourses/auth_remote_data_sourse.dart';
import 'features/auth/data/repositres/auth_repository_imp.dart';
import 'features/auth/domain/usecases/user_singup.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependancies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: Appsecrets.superSecretURL,
    anonKey: Appsecrets.supabaseKey,
  );
  serviceLocator.registerLazySingleton(
          () => supabase.client
  );
}
void _initAuth(){
  //this is dataSourse
serviceLocator..registerFactory<AuthRemoteDataSource>(
        () =>  AuthRemoteDataSourceImpl(
          serviceLocator(),
))
  //this is repositry
  ..registerFactory<AuthRepositry>(
        () =>  AuthRepositroyImp(
          serviceLocator(),
))
 //this is usecase
  ..registerFactory(
        () =>  UserSignUp(
          serviceLocator(),
))..registerFactory(
        () =>  UserLogin(
      serviceLocator(),
    ))..registerLazySingleton(
        () => AuthBloc(
          userSignUp: serviceLocator(),
          userLogin:  serviceLocator(),
        ));
}
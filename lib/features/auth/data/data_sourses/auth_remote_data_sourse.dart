import 'package:blogflutter/core/error/exceptions.dart';
import 'package:blogflutter/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get CurrntUserSession;
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserModel> singUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrentUserData();
}
class AuthRemoteDataSourceImpl implements
    AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Session? get CurrntUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    try{
      final response = await supabaseClient.auth.signInWithPassword(
          password:password,
          email:email,
      );
      if(response.user == null) {
        throw ServerException('user not found');
      }
      return UserModel.fromjason(response.user!.toJson());
    }catch(e){
      throw ServerException(e.toString());
    }

  }
  @override
  Future<UserModel> singUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
   try{
    final response = await supabaseClient.auth.signUp(
         password:password,
         email:email,
         data:{
           'name':name
         });
    if(response.user == null) {
      throw ServerException('user not found');
    }
    return UserModel.fromjason(response.user!.toJson());
   }catch(e){
     throw ServerException(e.toString());
   }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try{
      if(CurrntUserSession!=null) {
        final userData = await supabaseClient.from("profiles")
            .select().eq(
            'id',
            CurrntUserSession!.user.id
        );
        return UserModel.fromjason(userData .first);
      }

    }catch(e){
      throw ServerException(e.toString());
    }
  }
}
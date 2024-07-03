import 'package:blogflutter/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<String> singUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
class AuthRemoteDataSourceImpl implements
    AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }
  @override
  Future<String> singUpWithEmailAndPassword({
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
    return response.user!.id;
   }catch(e){
     throw ServerException(e.toString());
   }
  }
}
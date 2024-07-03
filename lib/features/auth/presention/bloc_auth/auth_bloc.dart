
import 'package:blogflutter/features/auth/domain/usecases/user_singup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
}):_userSignUp = userSignUp,
  super(AuthInitial()){
    on<AuthSignUp>((event, emit) async {
     final res=await _userSignUp(UserSingUpParams(
        name: event.name,
        email: event.email,
        password: event.password
      ));
     res.fold(
             (failure) => emit(AuthFailure(failure.message)),
             (uid) => emit(AuthSuccess(uid)));

    });
  }


  }


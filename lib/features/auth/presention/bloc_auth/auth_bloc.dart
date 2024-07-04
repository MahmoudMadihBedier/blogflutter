
import 'package:blogflutter/features/auth/domain/entities/user.dart';
import 'package:blogflutter/features/auth/domain/usecases/user_singup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/user_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin  _userLogin;
  AuthBloc({
    required UserLogin userLogin,
    required UserSignUp userSignUp,
}):_userSignUp = userSignUp,
   _userLogin = userLogin,
  super(AuthInitial()){
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
  }
  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res=await _userLogin(UserLoginParams(
        email: event.email,
        password: event.password
    ));
    res.fold(
            (failure) => emit(AuthFailure(failure.message)),
            (user) => emit(AuthSuccess(user)));
  }

void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  final res=await _userSignUp(UserSingUpParams(
      name: event.name,
      email: event.email,
      password: event.password
  ));
  res.fold(
          (failure) => emit(AuthFailure(failure.message)),
          (user) => emit(AuthSuccess(user)));

}
  }


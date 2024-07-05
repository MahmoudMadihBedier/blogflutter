import 'package:blogflutter/core/theme/app_pallete.dart';
import 'package:blogflutter/features/auth/presention/bloc_auth/auth_bloc.dart';
import 'package:blogflutter/features/auth/presention/pages/sinup_page.dart';
import 'package:blogflutter/features/auth/presention/widgets/auth_field.dart';
import 'package:blogflutter/features/auth/presention/widgets/auth_gradinat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widget/loader.dart';
import '../../../../core/utils/show_snak_bar.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // formKey.currentState!.validate();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthFailure){
              showSnackBar(context,  state.message);
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              return const Loader();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign In.',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 30,),

                  SizedBox(height: 10,),
                  Authfield(hintText: "E-mail", controller: emailController,),
                  SizedBox(height: 10,),
                  Authfield(hintText: "Password",
                    controller: passwordController,
                    isObscureText: true,),
                  SizedBox(height: 20,),
                  AuthGridentButton(
                      ButtonText: "Sign In",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthLogin(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim()
                          ));
                        }
                      }),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SingupPage.route());
                    },
                    child: RichText(text:
                    const TextSpan(
                        text: 'don\'t have an account?   ',
                        style: TextStyle(
                            color: Colors.white
                        ),
                        children: [
                          TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                  color: AppPallete.gradient2
                              )
                          )
                        ]
                    ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}

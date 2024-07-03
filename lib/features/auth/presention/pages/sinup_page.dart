import 'package:blogflutter/core/theme/app_pallete.dart';
import 'package:blogflutter/features/auth/presention/pages/login_page.dart';
import 'package:blogflutter/features/auth/presention/widgets/auth_field.dart';
import 'package:blogflutter/features/auth/presention/widgets/auth_gradinat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SingupPage());
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    // formKey.currentState!.validate();
    return Scaffold(
      appBar:AppBar (
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign up.',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 30,),
              Authfield(hintText: "Name",controller: nameController,),
              SizedBox(height: 10,),
              Authfield(hintText: "E-mail",controller: emailController,),
              SizedBox(height: 10,),
              Authfield(hintText: "Password",controller: passwordController,isObscureText: true,),
              SizedBox(height: 20,),
              AuthGridentButton( ButtonText: "Sign up",),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,LoginPage.route());
                },
                child: RichText(text:
                const TextSpan(
                  text:  'Already have an account?   ',
                    style: TextStyle(
                      color: Colors.white
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
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
        ),
      ),

    );
  }
}

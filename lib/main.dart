import 'package:blogflutter/core/theme/theme.dart';
import 'package:blogflutter/features/auth/presention/bloc_auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presention/pages/login_page.dart';
import 'intit_dependancies.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependancies();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (_)=>serviceLocator<AuthBloc>(),
      ),
      
    ],
       child: const MyApp(),

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blog app',
      theme:AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}

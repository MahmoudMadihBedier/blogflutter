import 'package:blogflutter/core/secrets/secrets.dart';
import 'package:blogflutter/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/presention/pages/login_page.dart';
import 'features/auth/presention/pages/sinup_page.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: Appsecrets.superSecretURL,
      anonKey: Appsecrets.supabaseKey);
  runApp(const MyApp());
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

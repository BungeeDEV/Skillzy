import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillzy/core/configs/theme/app_theme.dart';
import 'package:skillzy/firebase_options.dart';
import 'package:skillzy/presentation/splash/pages/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yaywixfxurysqinnyrwv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlheXdpeGZ4dXJ5c3Fpbm55cnd2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM2NTc0NjcsImV4cCI6MjA0OTIzMzQ2N30.6P_wvaOS2COVlcLU7Aspx0u2ntwK1klwgne-KjCsOoQ',
  );

  /// Set up firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}

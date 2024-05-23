import 'package:flutter/material.dart';
import 'package:potenday/src/config/sqlite_config.dart';
import 'package:potenday/src/provider/bottom_navigation_bar_provider.dart';
import 'package:potenday/src/view/template/main_template.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // must be above all

  // sqlite
  SQLiteConfig();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavigationBarProvider(),
          )
        ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainTemplate(),
        // '/': (context) => const PermissionTemplate(),
        // '/login': (context) => const LoginTemplate(),
        // '/terms': (context) => const SignTermsTemplate(),
        // '/home': (context) => const MainTemplate(),
      },
    );
  }
}

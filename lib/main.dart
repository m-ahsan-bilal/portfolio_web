import 'package:ahsan_dev/utils/go_router.dart';
import 'package:ahsan_dev/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ahsan.Dev',
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),

      // theme: ThemeData(
      // primaryColor: Colors.white,
      // fontFamily: 'Roboto',

      // ),
      routerConfig: basicRoutes,
    );
  }
}

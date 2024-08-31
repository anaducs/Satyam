import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satyam/constants/global_variable.dart';
import 'package:satyam/features/auth/screen/auth_screen.dart';
import 'package:satyam/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Satyam',
            theme: ThemeData(
                scaffoldBackgroundColor: GlobalVariables.backgroundColor,
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                colorScheme: const ColorScheme.light(
                  primary: GlobalVariables.secondaryColor,
                )),
            onGenerateRoute: (settings) => generateRoute(settings),
            home: const AuthScreen(),
          );
        });
  }
}

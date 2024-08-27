import 'package:flutter/material.dart';
import 'package:satyam/features/auth/screen/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case AuthScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => AuthScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Text('data'),
        ),
      );
  }
}

import 'package:flutter/material.dart';
import './screens/RegisterScreen.dart';
import './screens/LoginScreen.dart';
import './screens/HomeScreen.dart';

var routes = <String, WidgetBuilder> {
      '/register': (BuildContext context) => const RegisterScreen(),
      // '/login': (BuildContext context) => const LoginScreen(),
      // '/home': (BuildContext context) => const HomeScreen(),
};
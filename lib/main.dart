import 'package:flutter/material.dart';
import 'package:e_commerce_application/router.dart';
import 'package:e_commerce_application/constants/global_vars.dart';
import 'package:e_commerce_application/features/auth/screens/auth_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Commerce Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVars.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVars.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              )
          )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
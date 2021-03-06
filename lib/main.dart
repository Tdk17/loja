import 'package:aloja/models/user_maneger.dart';
import 'package:aloja/screens/base_screen.dart';
import 'package:aloja/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());

 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Loja',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4,125,141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4,125,141),
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
       initialRoute: '/base',
       onGenerateRoute: (settings){
          switch(settings.name){
            case '/signup' :
              return MaterialPageRoute(
                builder: (_) => SignUpScreen()
              );
            case '/base':
            default :
              return MaterialPageRoute(
                builder: (_) => BaseScreen()
              );
          }
       },
      ),
    );
  }
}


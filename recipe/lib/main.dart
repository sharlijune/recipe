import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/addpage.dart';
import 'package:todo/pages/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'services/auth.dart';
import 'models/FirebaseUser.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
     runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().user,
       initialData: null,
       child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 9, 72, 167),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromARGB(255, 38, 50, 158),
          textTheme: ButtonTextTheme.primary,
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
        ),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        ),
      home: Wrapper(),
    ),);

  }
}
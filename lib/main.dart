import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/app/bloc_observer.dart';
import 'package:login/app/pages/login_page.dart';
export 'package:login/app/bloc/app_bloc.dart';
export 'package:login/app/bloc_observer.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primaryColor: Color.fromRGBO(71, 142, 221, 1)),
      debugShowCheckedModeBanner: false,
    );
  }
}

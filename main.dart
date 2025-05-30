import 'package:cui_admission/firebase_options.dart';
import 'package:cui_admission/splash%20screen/splash_screen.dart';
import 'package:cui_admission/statemanagement/auth_prov.dart';
import 'package:cui_admission/statemanagement/splash_specification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(
    ChangeNotifierProvider(
      create: (context) => EmailAuthProv(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashSpecification()),
        ChangeNotifierProvider(create: (context) => EmailAuthProv()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Material App',
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

import 'package:chatapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.black)
      ),),
      home: const WelcomePage(),
      //home: const WelcomePage(),
      // initialRoute: WelcomePage.id,
      // routes: {
      //   "welcome" : ((context) => const WelcomePage()),
      //   "login" : ((context) => const LoginPage()),
      //   "registration" : ((context) => const RegistrationPage()),
      //   "chat" : ((context) => const ChatPage()),
      // }, 
    );}}
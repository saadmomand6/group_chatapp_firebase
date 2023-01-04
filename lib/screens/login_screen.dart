import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  with TickerProviderStateMixin {
  //final loginTextController = TextEditingController();
  bool showspinner = false;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  late AnimationController  _controller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:const Duration(seconds: 1),
      vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color.fromARGB(255, 197, 5, 5),
          body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
                  const Hero(
                  tag: 'logo',
                   child:Image(image: AssetImage("assets/avatar.png"),width: 120,height: 120,
                   ),),
                   //Image.asset("aassets/avatar.png",width: 120,height: 120,)),
               const SizedBox(
                height: 50,
              ),
              
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  color: Colors.transparent,
                  width: 300,
                  child: TextField(
                    //controller: loginTextController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Your Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(254, 237, 0, 1)),
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromRGBO(254, 237, 0, 1),
                      ),
                    ),
                  ),
                ),
                 const SizedBox(
                height: 50,
               ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  color: Colors.transparent,
                  width: 300,
                  child: TextField(
                   //controller: loginTextController,
                    obscureText: true,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Your Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(254, 237, 0, 1)),
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Color.fromRGBO(254, 237, 0, 1),
                      ),
                    ),
                  ),
                ),
               const SizedBox(
                height: 50,
               ),
              
              
               Center(
                 child: SizedBox(
                  width: _animation.value*100,
                   child: ElevatedButton(
                    onPressed: ()async{
                      //loginTextController.clear();
                      try{
                        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        // ignore: unnecessary_null_comparison
                        if (user !=null) {
                          if (!mounted) return;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChatPage()),);
                        }
                        } catch(e){
                          // ignore: avoid_print
                          print(e);
                        }
                   },
                   
                   style: ElevatedButton.styleFrom(
                         shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),),
                         backgroundColor: const Color.fromRGBO(254, 237, 0, 1),
                            ),
                   child: const Text('LOGIN', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
                 ),
               ),
            ]
              ),
              )
              );
}
}
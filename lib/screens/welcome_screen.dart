import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:chatapp/mainbutton.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcome';
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>  with SingleTickerProviderStateMixin{
 late AnimationController _controller;
late Animation _animation; 
   late Animation textanimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      
      vsync: this,
      upperBound: 1.0,
      );
      _animation = ColorTween(begin: const Color.fromARGB(255, 255, 255, 255),end: const  Color.fromARGB(255, 197, 5, 5)).animate(_controller);
       textanimation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
      _controller.forward();
      // animation.addStatusListener((status) {
      //   if (status == AnimationStatus.completed) {
      //     controller.reverse(from: 1);
      //   }else if(status == AnimationStatus.dismissed){
      //     controller.forward();
      //   }
      // });
      _controller.addListener(() {
        setState(() {});
            });


  }

@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: _animation.value,
          body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [
                  const Hero(
                    tag: 'logo',
                    child: Image(image: AssetImage("assets/avatar.png"),width: 80,height: 80,
                   ),
                    //child: Image.asset('avatar.png',width: 80, height: 80,)
                    ),
                  
                  const SizedBox(
                    width: 5,
                      ),
                  Container(
                    color: Colors.transparent,
                    width: 200,
                    child: Column(
                      children:  [
                        Text('Flash Chat App',
                            style: TextStyle(
                         fontSize: textanimation.value*28,
                         color: Colors.yellow,
                         fontWeight: FontWeight.w900,
                            ),),
                        // const Divider(
                        //   height: 2,
                        //   color: Colors.yellow,
                        //   thickness: 5,
                    
                        // )
                      ],
                    ),
                  ),
                  

                      
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MainButtons(tittle: "Login Your Account", onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()),);
                        //Navigator.pushNamed(context, LoginPage.id);
        
                    },),
              const SizedBox(
                height: 50,
              ),
              MainButtons(tittle: "Get Registered", onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrationPage()),);
                  //Navigator.pushNamed(context, RegistrationPage.id);
                },),
            ]),));
  }
}

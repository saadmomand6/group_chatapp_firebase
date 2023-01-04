import 'package:flutter/material.dart';


class MainButtons extends StatelessWidget {
  
  final String tittle;
  final VoidCallback onPressed;

  const MainButtons({
    required this.tittle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: ElevatedButton(onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12),),
            backgroundColor: Colors.yellow,
               ),
      child:  Text(tittle, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
    );
  }
}


// class SignUp extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final String? onchanged;
//   const SignUp({
//     Key? key,
//     this.onchanged,
//     required this.text,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 50),
//       color: Colors.transparent,
//        width: 300,
//      child: TextField(
//        style: const TextStyle(
//          color: Colors.white,
//        ),
//     //  onChanged:(value) {
//     //    value = onchanged;
//     //  },
//        decoration: InputDecoration(
        
//          hintText: text,
//          labelStyle:  const TextStyle(
//            color: Colors.white,
//          ),
//          enabledBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//                    ),
//          prefixIcon: Icon(
//               (icon),
//               color: const Color.fromRGBO(254, 237, 0, 1),
//             ),
//        ),
       
//      ),
//               );
//   }
// }

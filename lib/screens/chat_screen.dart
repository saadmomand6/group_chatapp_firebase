import 'package:flutter/material.dart';
import 'package:chatapp/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'chat';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;
  String? messagetext;

  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser(){
    try{
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 5, 5),
      appBar: AppBar(
        //leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close,color: Color.fromARGB(255, 197, 5, 5),),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat',
        style: TextStyle(color: Color.fromARGB(255, 197, 5, 5)),),
        backgroundColor: Colors.yellow,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("messages").orderBy('timestamp', descending: false).snapshots(),
              builder: (context,AsyncSnapshot snapshot){
               if(!snapshot.hasData){
                // ignore: avoid_print
                print("no msg send");
               }
              else if(/*snapshot != null &&*/ snapshot.hasData && snapshot.data.docs != null){
                final messages = snapshot.data.docs.reversed;
                List<Messagebuble> messageBubbles = [];
                for(var msg in messages){
                  final messageText = msg.data()["text"];
                  final messageSender = msg.data()["sender"];
                  final currentuser = loggedInUser?.email;
                  final msgBubble = Messagebuble(
                    sender: messageSender, 
                    text: messageText,
                    isme: currentuser == messageSender,
                    );
                  messageBubbles.add(msgBubble);
                }
                return Expanded(
                  child: ListView(
                    reverse: true ,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: messageBubbles,
                  ),
                );
               
              }
              return Column();
              }
              ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                         messagetext = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                     _firestore.collection("messages").add({
                      "text": messagetext,
                      "sender": loggedInUser?.email,
                      'timestamp': FieldValue.serverTimestamp(),
                     });
                    },
                    child:const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Messagebuble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isme;
  const Messagebuble({
    
    
    required this.sender,
    required this.text,
    required this.isme,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isme? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          Text(sender,style: const  TextStyle(fontSize: 12,color: Color.fromARGB(255, 230, 221, 143)),),
          Material(
            borderRadius: isme? const BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30), 
            bottomRight: Radius.circular(30)): const  BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30), 
            bottomRight: Radius.circular(30)),
            elevation: 5,
            color: isme? const Color.fromRGBO(254, 237, 0, 1) : Colors.white,
           // color: const Color.fromRGBO(254, 237, 0, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(text,
              style: const TextStyle(fontSize: 15,color: Colors.black),
          ),
            ),),
        ],
      ),
    );
  }
}
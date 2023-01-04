import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Color.fromRGBO(254, 237, 0, 1),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: Color.fromRGBO(254, 237, 0, 1)),
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color.fromRGBO(254, 237, 0, 1), width: 2.0),
  ),
);



import 'package:flutter/material.dart';

void main() {
  runApp(ChatWithMeApp());
}

class ChatWithMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatWithMe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('ChatWithMe')),
        body: Center(child: Text('Benvenuto su ChatWithMe!')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Timer(),
    );
  }
}

class Timer extends StatefulWidget{
  @override
  _TimerState createState() => _TimerState();
}
class _TimerState extends State<Timer>{
  @override
  Widget build (BuildContext context){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10, top: 200),
          child: Card(
            color: Colors.black,
            child: CircleAvatar(),
          ),
        ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 250),
            child: Card(
              color: Colors.black,
              child: CircleAvatar(),
            ),
          ),  
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, top: 300),
              child: Card(
                color: Colors.blue,
                child: CircleAvatar(),
              ),
            ),
      ],
    );
  }
}
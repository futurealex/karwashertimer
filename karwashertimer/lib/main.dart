import "package:flutter/material.dart";

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Timer",
  home: Clock(),
));

class Clock extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return ClockState();
  }
}

class ClockState extends State<Clock> with SingleTickerProviderStateMixin{

  Animation animation;
  AnimationController animationController;

  ClockState();

  _currentTime(){
    return "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
  }

  @override

  void initState() {
    super.initState();

    animationController = AnimationController(vsync:this,duration: Duration(seconds: 1));
    animationController.addListener((){
      if (animationController.isCompleted){
        animationController.reverse();
      }else if(animationController.isDismissed){
        animationController.forward();
      }
     setState(() {
       
     });
    });
    animationController.forward();
  }


  @override
  Widget build(BuildContext context){

    animation = CurvedAnimation(parent:animationController, curve:Curves.easeInOut );
    animation = Tween(begin: -0.5, end: 0.5,).animate(animation);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Clock")),
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.deepOrange,
        width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         child: Column(
           children: <Widget>[
             Material(
               borderRadius: BorderRadius.all(Radius.circular(50.0)),
               elevation: 10.0,
               color: Colors.white,
               child: Container(
                 width:200,
                 height: 180,
                 child: Center(
                 child: Text(_currentTime(), style: TextStyle(
                   fontSize: 35.0,
                   fontWeight: FontWeight.bold,
                 ),),
               ),
               )
             ),
             Transform(
                alignment: FractionalOffset(0.5, 0.0),
                 transform: Matrix4.rotationZ(animation.value),
                 child: Image.asset("assets/pendulum.png",width:70 ,height: 100,),
               
             )
           ],
         ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AnimatedBottomMenu extends StatefulWidget {
  @override
  _AnimatedBottomMenuState createState() => _AnimatedBottomMenuState();
}

class _AnimatedBottomMenuState extends State<AnimatedBottomMenu> with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500),);

    controller.addListener((){
      setState(() {
        
      });
    });
  
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: (){
            controller.forward();
          }),
        ],
      ),
      body: Stack(children: [
        Container(
          color: Colors.lime,
        ),
        Positioned(
          top: controller.value*screenSize.height,
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.grey[900],
          ),
        ),
      ]),
    );
  }
}

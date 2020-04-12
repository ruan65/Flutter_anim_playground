import 'package:flutter/material.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  @override
  _AnimatedPaddingScreenState createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(

      vsync: this,
      duration: Duration(seconds: 1),
    );
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {

          animationController.repeat(reverse: true);
        },
        child: Padding(
          padding: EdgeInsets.all(animationController.value * 100),
          child: Container(
            color: Colors.cyan,
          ),
        ),
      ),
    );
  }
}

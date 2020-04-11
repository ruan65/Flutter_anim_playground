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
      // print(animationController.value);
      setState(() {});
    });
    // animationController.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     animationController.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     animationController.forward();
    //   }
    // },
    // );
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

import 'package:flutter/material.dart';

class AnimatedBottomMenu extends StatefulWidget {
  @override
  _AnimatedBottomMenuState createState() => _AnimatedBottomMenuState();
}

class _AnimatedBottomMenuState extends State<AnimatedBottomMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Size screenSize;
  Animation _bottomMenuAnimation;
  Animation _modalShadowAnimation;
  bool isMenuOpen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initAnimationController();
  }

  void _initAnimationController() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    screenSize = MediaQuery.of(context).size;
    _bottomMenuAnimation =
        Tween<double>(begin: screenSize.height, end: screenSize.height / 2)
            .animate(controller);

    _modalShadowAnimation = ColorTween(begin: Colors.transparent, end: Color(0x55000000)).animate(controller);        

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _togleBottomMenu();
              }),
        ],
      ),
      body: Stack(children: [
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(),
              ),

              RaisedButton(onPressed: (){},
                child: Text('submit'),
              ),
            ],
          ),
        ),

        Positioned(
          top: isMenuOpen ? 0 : screenSize.height,
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            color: _modalShadowAnimation.value,
          ),
        ),

        Positioned(
          top: _bottomMenuAnimation.value,
          child: GestureDetector(
            onTap: (){
              _togleBottomMenu();
            },
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.blue,
            ),
          ),
        ),
      ]),
    );
  }

  void _togleBottomMenu() {
    isMenuOpen ? controller.reverse() : controller.forward();
    isMenuOpen = !isMenuOpen;
    setState(() {});
  }
}

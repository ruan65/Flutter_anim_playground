import 'package:flutter/material.dart';
import 'package:flutter_anim_playground/ui/animated_padding_screen.dart';

import 'animated_bottom_menu.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Padding Anim'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedPaddingScreen()));
              },
            ),
            RaisedButton(
              child: Text('Bottom menu'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedBottomMenu()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

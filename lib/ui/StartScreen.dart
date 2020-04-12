import 'package:flutter/material.dart';
import 'package:flutter_anim_playground/ui/animated_padding_screen.dart';
import 'package:flutter_anim_playground/ui/delete_message.dart';
import 'animated_bottom_menu.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Padding Anim'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedPaddingScreen()));
              },
            ),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              
              child: Text('Bottom menu',),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimatedBottomMenu()));
              },
            ),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Delete message',),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DeleteMessage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

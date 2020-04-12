import 'package:flutter/material.dart';

class DeleteMessage extends StatefulWidget {
  @override
  _DeleteMessageState createState() => _DeleteMessageState();
}

class _DeleteMessageState extends State<DeleteMessage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    // if (controller != null) {
    //   controller.dispose();
    // }
    controller?.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Mail', style: TextStyle(color: Color(0xFF007AFF))),
      ),
      body: Column(children: [
        Row(
          children: <Widget>[
            Stack(children: [
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  print('object');
                  controller.forward();
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('LOT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text('upcoming', style: TextStyle(fontSize: 20)),
                      Text(
                          'tune in this friday to explore the upcoming LOT Sound module',
                          style: TextStyle(
                              fontSize: 20, color: Color(0xFF8A8A8E))),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width -
                    controller.value * MediaQuery.of(context).size.width,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Color(0xFFFF3B30),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  // child: Text('Message'),
                ),
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}

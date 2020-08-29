import 'dart:math';

import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  Color _color = Colors.blue;
  double _width = 100;
  double _height = 100;
  double _radius = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animator Container'),
      ),
      body: Center(
        child: _createAnimatiorContainer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAnimation(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _createAnimatiorContainer() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: _width,
      height: _height,
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
          color: _color, borderRadius: BorderRadius.circular(_radius)),
    );
  }

  void _startAnimation() {
    setState(() {
      _width = new Random().nextInt(300).toDouble();
      _height = new Random().nextInt(300).toDouble();
      _color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255), 1);
      _radius = Random().nextInt(50).toDouble();
    });
  }
}

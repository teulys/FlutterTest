import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _listItems = new List();
  int _max = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ListView')),
        body: Stack(
          children: [_crearLista(), _crearProgresBar()],
        ));
  }

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addTen();
        _HTTPSimulation();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        final int imageValue = _listItems[index];
        return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://picsum.photos/500/300/?image=$imageValue'));
      },
      itemCount: _listItems.length,
    );
  }

  Widget _crearProgresBar() {
    if (_isLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  void _addTen() {
    for (var i = 1; i <= 5; i++) {
      _max++;
      _listItems.add(_max);
    }
    setState(() {});
  }

  Future<Null> _HTTPSimulation() async {
    _isLoading = true;

    setState(() {});

    new Timer(Duration(seconds: 2), _HTTPcallback);

    return null;
  }

  void _HTTPcallback() {
    _isLoading = false;
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: Duration(microseconds: 100),
        curve: Curves.decelerate);
    _addTen();
  }
}

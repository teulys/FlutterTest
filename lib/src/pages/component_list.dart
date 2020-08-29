import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  final List<String> lista = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: ListView(
          children: _crearListaCorto(),
        ));
  }

  List<Widget> _listItems() {
    List<Widget> items = List<Widget>();

    for (var item in lista) {
      final ListTile title = ListTile(
        title: Text(item),
      );
      items..add(title)..add(Divider());
    }

    return items;
  }

  List<Widget> _crearListaCorto() {
    return lista.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e),
            subtitle: Text('Otra cosas de $e'),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icons_string_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], //Infirmacion que va a tener por defecto en lo que se resuelve la promesa
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => ListView(
        children: _listItems(snapshot.data, context),
      ),
    );

    // return ListView(
    //   children: _listItems(),
    // );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    // final List<Widget> options = [];

    // data.forEach((element) {
    //   final widgetTemp = ListTile(
    //     title: Text(element['texto']),
    //   );

    //   options..add(widgetTemp)..add(Divider());
    // });

    return data.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e['texto']),
            leading: getIcon(e['icon']),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
            onTap: () {
              Navigator.pushNamed(context, e['ruta']);
            },
          ),
          Divider()
        ],
      );
    }).toList();

    // return options;
  }
}

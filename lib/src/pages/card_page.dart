import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: _createListView(),
    );
  }

  Widget _createListView() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [_cardTipo1(), _cardImagen()],
    );
  }

  Widget _cardTipo1() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 10.0,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Martín Lutero'),
            leading: Icon(
              Icons.ac_unit,
              color: Colors.blue,
            ),
            subtitle: Text(
                'nacido como Martin Luder,1​ después cambiado a Martin Luther, como es conocido en alemán (Eisleben, Alemania, 10 de noviembre de 1483-ibidem, 18 de febrero de 1546), fue un teólogo y fraile católico agustino que comenzó e impulsó la reforma religiosa en Alemania y en cuyas enseñanzas se inspiraron la Reforma protestante y la doctrina teológica y cultural denominada luteranismo.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                  onPressed: () {},
                  child:
                      Text('Cancelar', style: TextStyle(color: Colors.blue))),
              FlatButton(
                  onPressed: () {},
                  child: Text('Ok', style: TextStyle(color: Colors.blue))),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardImagen() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      elevation: 10.0,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage('https://fondosmil.com/fondo/17023.jpg')),
          ),
          Text('Imagen UltraHD 4K')
        ],
      ),
    );
  }
}

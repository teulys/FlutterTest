import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValude = 100.0;
  bool _blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider and Check'),
      ),
      body: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 40.0), child: _crearSlider()),
          _crearCheckBox(),
          _crearSwich(),
          Expanded(child: _crearImagen()),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        min: 10.0,
        max: 400.0,
        activeColor: Colors.indigoAccent,
        //divisions: 20,
        label: 'Tamaño de la imagen',
        value: _sliderValude,
        onChanged: (_blockSlider)
            ? null
            : (value) {
                setState(() {
                  _sliderValude = value;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.jing.fm/clipimg/full/33-334728_batman-png-images-free-download-batman-png.png'),
      width: _sliderValude,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //     value: _blockSlider,
    //     onChanged: (value) {
    //       setState(() {
    //         _blockSlider = value;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _blockSlider,
        onChanged: (value) {
          setState(() {
            _blockSlider = value;
          });
        });
  }

  Widget _crearSwich() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _blockSlider,
        onChanged: (value) {
          setState(() {
            _blockSlider = value;
          });
        });
  }
}

import 'package:flutter/material.dart';

class FieldsPage extends StatefulWidget {
  FieldsPage({Key key}) : super(key: key);

  @override
  _FieldsPageState createState() => _FieldsPageState();
}

class _FieldsPageState extends State<FieldsPage> {
  @override
  String _nombre = '';
  int _counter = 0;
  String _dateSelected = '';
  TextEditingController _dateFieldController = new TextEditingController();
  List<String> _poderes = ['Volar', 'Super fuerza', 'Correr', 'Soplar'];
  String _poderSeleccionado = 'Volar';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fields'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _nameTextField(),
          Divider(),
          _emailTextField(),
          Divider(),
          _passTextField(),
          Divider(),
          _datePicket(),
          Divider(),
          _createDropDown(),
        ],
      ),
    );
  }

  Widget _nameTextField() {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Nombre cliente',
        counterText: '$_counter characters',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        suffixIcon: Icon(Icons.ac_unit),
      ),
      onChanged: (value) {
        setState(() {
          _counter = value.length;
          _nombre = value;
        });
      },
    );
  }

  Widget _emailTextField() {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'Email',
        labelText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        suffixIcon: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _passTextField() {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Password',
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        suffixIcon: Icon(Icons.lock_open),
      ),
      obscureText: true,
    );
  }

  Widget _datePicket() {
    return TextField(
      controller: _dateFieldController,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        suffixIcon: Icon(Icons.calendar_today_sharp),
      ),
      enableInteractiveSelection: false,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime dateTime = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1970),
        lastDate: new DateTime.now(),
        locale: Locale('es', 'ES'));

    if (dateTime != null) {
      _dateSelected = dateTime.toString();
      setState(() {
        _dateFieldController.text = _dateSelected;
      });
    }
  }

  Widget _createDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
            child: DropdownButton(
                items: _getDropDownMenuItems(),
                value: _poderSeleccionado,
                onChanged: (opt) {
                  setState(() {
                    _poderSeleccionado = opt;
                  });
                })),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> lista = List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    });

    return lista;
  }
}

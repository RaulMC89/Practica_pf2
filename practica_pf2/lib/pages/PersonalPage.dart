import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key? key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  String _nom = '';
  String _cognom = '';
  String _date = '';
  String _email = '';
  String _data = '';
  String _contrasenya = '';
  String _persona1 = '';
  String _persona2 = '';
  String _persona3 = '';
  TextEditingController _inputFieldDataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const List<String> personas = ['characters'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Martinez',
          style: TextStyle(color: Colors.brown, fontSize: 50.0),
        ),
        centerTitle: true,
        flexibleSpace: _cardTipus1(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearNom(),
          Divider(),
          _crearCognom(),
          Divider(),
          _crearData(context),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearPersona(),
          Divider(),
          ElevatedButton(
            child: Text('Desa'),
            onPressed: () {
              final String r = (_persona3 += ('\n$_persona1\n$_persona2'));
              Navigator.of(context).pop(r);
            },
          ),
        ],
      ),
    );
  }

  _crearNom() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        // ignore: prefer_interpolation_to_compose_strings
        counter: Text('Lletres ${_nom.length}'),
        hintText: 'Nom de l\'usuari',
        labelText: 'Nom',
        helperText: 'Posi el nom.',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _nom = valor;
          // print(_nom);
        });
      },
    );
  }

  _crearCognom() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        // ignore: prefer_interpolation_to_compose_strings
        counter: Text('Lletres ${_cognom.length}'),
        labelText: 'Cognom',
        helperText: 'Posi els cognoms.',
        suffixIcon: Icon(Icons.accessibility_rounded),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _cognom = valor;
          // print(_nom);
        });
      },
    );
  }

  _crearPersona() {
    return ListTile(
      title: Text(_persona1 = 'Nom: $_nom \nCognom: $_cognom'),
      subtitle: Text(_persona2 =
          'Data naixement: $_data \nCorreu: $_email \nContrasenya: $_contrasenya'),
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        // ignore: prefer_interpolation_to_compose_strings
        hintText: 'Correu electronic',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
          // print(_nom);
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (valor) {
        setState(() {
          _contrasenya = valor;
          // print(_nom);
        });
      },
      obscureText: true,
    );
  }

  _crearData(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Data naixement',
          labelText: 'Data naixement',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionaData(context);
      },
      onChanged: (valor) {
        setState(() {
          _contrasenya = valor;
          // print(_nom);
        });
      },
    );
  }

  _seleccionaData(BuildContext context) async {
    // ignore: unused_local_variable

    DateTime? picked = await showDatePicker(
        context: context,
        locale: Locale('ca', 'CA'),
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        var formate1 = "${picked.day}-${picked.month}-${picked.year}";
        _data = formate1.toString();
        _inputFieldDataController.text = _data;
      });
    }
  }
}

_cardTipus1() {
  final targeta = Container(
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    //clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        FadeInImage(
          placeholder: AssetImage('assets/Son_gohan.gif'),
          image: NetworkImage(
              'https://www.drakonball.com/wp-content/uploads/2022/05/gohan-estudiando.jpg'),
          fadeInDuration: Duration(milliseconds: 1000),
          height: 88,
          width: 400,
          fit: BoxFit.fill,
        ),
      ],
    ),
  );
  return Container(
    child: ClipRRect(
      child: targeta,
    ),
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0))
      ],
    ),
  );
}

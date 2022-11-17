import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _persona = '';
  final _estil = TextStyle(fontSize: 30);
  Color color = Colors.yellow;
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 20),
    backgroundColor: Colors.white12,
    shadowColor: Colors.white12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 20.0,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'SPPMMD',
                style: TextStyle(color: Colors.brown, fontSize: 50.0),
              ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/Son_gohan.gif'),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('PersonalPage', arguments: _persona)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        _persona = value as String;
                      });
                    }
                  });
                },
                child: _cardTipus1(),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, 'WidgetPage');
                },
                child: _cardTipus2(),
              ),
              const SizedBox(height: 30),
              _cardTipus3(_persona),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _cardTipus2() {
  final targeta = Container(
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    //clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        FadeInImage(
          placeholder: AssetImage('assets/son-goku.gif'),
          image: NetworkImage(
              'https://i.giphy.com/media/oTjoawKEq3wYD5fKEh/giphy.gif'),
          fadeInDuration: Duration(milliseconds: 700),
          height: 250,
          fit: BoxFit.fill,
        ),
        Container(
          child: Text(
            'GALERIA DE IMAGENES',
            style: TextStyle(color: Colors.brown),
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ],
    ),
  );
  return Container(
    child: ClipRRect(
      child: targeta,
      borderRadius: BorderRadius.circular(30.0),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
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

Widget _cardTipus1() {
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
          height: 250,
          fit: BoxFit.fill,
        ),
        Container(
          child: Text(
            'FORMULARIO',
            style: TextStyle(color: Colors.brown),
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ],
    ),
  );
  return Container(
    child: ClipRRect(
      child: targeta,
      borderRadius: BorderRadius.circular(30.0),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
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

Widget _cardTipus3(String person) {
  return Card(
    elevation: 20.0,
    color: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    child: Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/Son_gohan.gif'),
          ),
          title: Text('Persona a afegir:',
              style: TextStyle(color: Colors.brown, fontSize: 20.0)),
          subtitle: Text(person),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {},
                child: Text('Suscriure',
                    style: TextStyle(color: Colors.brown, fontSize: 20.0))),
            TextButton(
                onPressed: () {},
                child: Text('Cancel.lar',
                    style: TextStyle(color: Colors.brown, fontSize: 20.0))),
          ],
        ),
      ],
    ),
  );
}

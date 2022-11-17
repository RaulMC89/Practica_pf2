import 'package:flutter/material.dart';
import 'package:practica_pf2/pages/HomePage.dart';
import 'package:practica_pf2/pages/PersonalPage.dart';
import 'package:practica_pf2/pages/WidgetPage.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'PersonalPage': (BuildContext context) => PersonalPage(),
    'WidgetPage': (BuildContext context) => WidgetPage(),
  };
}

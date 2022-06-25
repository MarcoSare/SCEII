import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sceii/screens/lista_actividades.dart';
import 'package:sceii/screens/lista_alumnos.dart';
import 'package:sceii/screens/perfil.dart';
import '../models/alumno.dart';
import '../models/student.dart';

class sideBarPerfil extends StatefulWidget {
  TextEditingController controlador = TextEditingController();

  var Alumno;
  sideBarPerfil({Key? key}) : super(key: key){

  }


  @override
  State<sideBarPerfil> createState() => _sideBarPerfilState();
}

class _sideBarPerfilState extends State<sideBarPerfil> {
  int _currentIndex = 0;
  _sideBarPerfilState(){

  }

  @override
  Widget build(BuildContext context) {
    var codigo;
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 20, 1),
      body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(23, 32, 42, 1),
                    radius: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 55,
                      backgroundImage: AssetImage('assets/johan.jpg'),
                    ),
                  ),
                  Expanded(
                      child: Text("Rojas Cardenas Johan", style: TextStyle(fontSize: 24,color: Colors.white,fontFamily: "PopPins"),)
                  )
                ],
              ),
            ),
          Container(
            height: 500,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 50),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
            child:
          ListView(
        children: <Widget>[
          Container(
            height:50,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white70),
                ),
              ),
              child:
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
              },
              child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications, size: 30,),
                    Expanded( child: Text("Notificaciones",style: TextStyle(color: Colors.white,fontSize:20),textAlign: TextAlign.left)),
                    Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 15,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10,
                            child:Text("1"),
                          ),
                        )
                    )
                  ]
              ))),
          Container(
              height:50,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white70),
                ),
              ),
              child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                  },
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.settings, size: 30,),
                        Expanded( child: Text("Configuracion",style: TextStyle(color: Colors.white,fontSize:20),textAlign: TextAlign.left)),
                      ]
                  ))),

          Container(
              height:50,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white70),
                ),
              ),
              child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => perfil()));
                  },
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.account_box, size: 30,),
                        Expanded( child: Text("Ver perfil",style: TextStyle(color: Colors.white,fontSize:20),textAlign: TextAlign.left)),
                      ]
                  ))),
          Container(
              height:50,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white70),
                ),
              ),
              child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                  },
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.book, size: 30,),
                        Expanded( child: Text("item-2",style: TextStyle(color: Colors.white,fontSize:20),textAlign: TextAlign.left)),
                      ]
                  ))),
          Container(
              height:50,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white70),
                ),
              ),
              child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                  },
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.logout, size: 30,color: Colors.red,),
                        Expanded( child: Text("Cerrar sesión",style: TextStyle(color: Colors.red,fontSize:20),textAlign: TextAlign.left)),
                      ]
                  )))
        ]))],
      ),
    );
  }








  Widget _getDrawer(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[850],
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(112, 173, 71, 1)),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/alumno.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Nombre del maestro',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Materias'),
              leading: Icon(Icons.home),
            ),
          ],
        ));
  }
}
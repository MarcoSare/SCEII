import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sceii/screens/widget.dart';


class editPerfil extends StatefulWidget {
  TextEditingController controlador = TextEditingController();

  var Alumno;
  editPerfil({Key? key}) : super(key: key){

  }


  @override
  State<editPerfil> createState() => _editPerfilState();
}

class _editPerfilState extends State<editPerfil> {
  textFormField2 nombre = textFormField2("Nombre", "Cambia tu nombre", "error",Icons.drive_file_rename_outline);
  int _currentIndex = 0;
  _editPerfilState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 20, 1),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        backgroundColor: Colors.transparent,
        selectedItemColor: Color.fromRGBO(112, 173, 71, 1),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home,
                  color: _currentIndex == 0 ? Color.fromRGBO(112, 173, 71, 1) : Colors.grey
              ),
              label: "home"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.settings,
                  color: _currentIndex == 1 ? Color.fromRGBO(112, 173, 71, 1) : Colors.grey
              ),
              label: "home"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.face,
                  color: _currentIndex == 2 ? Color.fromRGBO(112, 173, 71, 1) : Colors.grey
              ),
              label: "Clases"
          ),
        ],
        onTap: (int index){
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },

      ),
      drawer: _getDrawer(context),
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
              height: 530,
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
                            },
                            child:
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.book, size: 30,),
                                  Expanded( child: Text("item",style: TextStyle(color: Colors.white,fontSize:20),textAlign: TextAlign.left)),
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
                            ))),nombre
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
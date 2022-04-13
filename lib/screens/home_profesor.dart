import 'dart:io';

import 'package:flutter/material.dart';

class homeProfesor extends StatefulWidget {
  const homeProfesor({Key? key}) : super(key: key);

  @override
  State<homeProfesor> createState() => _homeProfesorState();
}

class _homeProfesorState extends State<homeProfesor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Bienvenido'),
        backgroundColor: Color.fromRGBO(112, 173, 71, 1),
      ),
      drawer: _getDrawer(context),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        children: <Widget>[
          _getCard(context),
          _getCard(context),
          _getCard(context),
          _getCard(context),
          _getCard(context),
          _getCard(context),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed:(){

        },
      ) ,
    );
  }

  Widget _getCard(BuildContext context){
    return Container(
        width: 100,
        height: 150,
        padding:const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Card(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          color: Colors.grey[850],
          elevation: 30,
          child: Column(
            children: <Widget>[
              Text("Investigación de operaciones",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Lista de alumnos',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => Pagina02()));
                  }),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Lista de Actividades',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //Navigator.push(context,
                    // MaterialPageRoute(builder: (context) => Pagina02()));
                  }),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
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

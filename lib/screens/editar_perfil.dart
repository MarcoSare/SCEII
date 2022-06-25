import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sceii/screens/model%20widget/widget.dart';


class editPerfil extends StatefulWidget {
  TextEditingController controlador = TextEditingController();

  var Alumno;
  editPerfil({Key? key}) : super(key: key){

  }


  @override
  State<editPerfil> createState() => _editPerfilState();
}

class _editPerfilState extends State<editPerfil> {
  textFormField2 nombre = textFormField2("Johan Rafael","Nombre", "Cambia tu nombre", "error",Icons.drive_file_rename_outline);
  textFormField2 apellidos = textFormField2("Rojas Cardenas","Apellidos", "Cambia tu apellidos", "error",Icons.drive_file_rename_outline);
  textChangedPass password = textChangedPass("","Contraseña", "Cambia tu contraseña", "error",Icons.drive_file_rename_outline);
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
      body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Transform.translate(offset: Offset(50,-40),
                  child:
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(23, 32, 42, 1),
                    radius: 30,
                  child: IconButton(icon: Icon(Icons.add_a_photo,color: Colors.white,size: 30,), onPressed: () {  },),
                )),
              ],
            ),
          ),
       Text("Editar perfil", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 28),textAlign: TextAlign.center,),
       nombre,
          apellidos,
          password,
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child:
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
          Container(
            height: 50,
            width: 150,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(70, 165, 37, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'Guardar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                onPressed: () {
                  //showAlu();
                }),
          ),
          Container(
            height: 50,
            width: 150,
            //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(222, 23, 59 , 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                onPressed: () {
                  //showAlu();
                }),
          )])),
                  ]),
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
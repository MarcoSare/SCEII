import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sceii/models/alumno.dart';
import 'package:sceii/models/alumnoDatos.dart';
import 'package:sceii/screens/registro/registro_alumno.dart';
import 'package:sceii/screens/registro/registro_docente.dart';
import 'package:sceii/screens/registro/registro_visitante.dart';
import 'package:sceii/screens/model%20widget/widget.dart';
import 'package:sceii/services/httpService.dart';
import 'package:sceii/tools/Dateformat.dart';

class registro extends StatefulWidget {
  const registro({Key? key}) : super(key: key);
  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(23, 32, 42, 1),
        body: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            children: <Widget>[
        Card(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
        color: Colors.transparent,
        elevation: 0,
        //shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.only(
        //bottomRight: Radius.circular(100),

        //)),
        child:
        Container(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(10, 10, 10, 1),
                    Color.fromRGBO(21, 21, 21, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Column(

            children:[
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 70),
              child: Text(
                'Registro',
                style: TextStyle(
                    fontSize: 32, color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold),
              )),
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(
                'Registrate como:',
                style: TextStyle(
                    fontSize: 20, color: Colors.white,fontFamily: "Poppins"),
              ))
          ] ,
        )
        )),
        Container(
          height: 80,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
          margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
          child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(70, 165, 37, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Jefe de laboratorio',
                style: TextStyle(fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => registroDocente()));
              }),
        ),Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(70, 165, 37, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Alumno',
                      style: TextStyle(fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => registroAlumno()));
                    }),
              ),Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(70, 165, 37, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Maestro',
                      style: TextStyle( fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => registroDocente()));
                    }),
              ),Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(70, 165, 37, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Visitante',
                      style: TextStyle(fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.bold),

                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => registroVisitante()));
                    }),
              )
            ])
    );

  }
}
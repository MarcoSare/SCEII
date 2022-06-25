import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sceii/screens/model%20widget/widget.dart';


class perfil extends StatefulWidget {
  TextEditingController controlador = TextEditingController();

  var Alumno;
  perfil({Key? key}) : super(key: key){

  }


  @override
  State<perfil> createState() => _perfilState();
}

class _perfilState extends State<perfil> {
  textFormField2 nombre = textFormField2("Johan Rafael","Nombre", "Cambia tu nombre", "error",Icons.drive_file_rename_outline);
  textFormField2 apellidos = textFormField2("Rojas Cardenas","Apellidos", "Cambia tu apellidos", "error",Icons.drive_file_rename_outline);
  textChangedPass password = textChangedPass("","Contraseña", "Cambia tu contraseña", "error",Icons.drive_file_rename_outline);
  int _currentIndex = 0;
  _perfilState(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text("Perfil"),
          backgroundColor: Colors.transparent
      ),
      backgroundColor: Color.fromRGBO(19, 20, 20, 1),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        child: Icon(Icons.school,color: Colors.white,size: 35,),
                      )),
                  Transform.translate(offset: Offset(0,0),
                  child:
                  Container(
                    height: 1000,
                    width: 1000,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(23, 32, 42, 1),
                            Color.fromRGBO(23, 32, 42, 1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: Column(
                      children: [
                        Text("Datos", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 28,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),

                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                              child: Icon(Icons.account_circle, size: 40, color: Colors.white,),),
                            Text("Johan Rafel Rojas Cardenas", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 20),textAlign: TextAlign.center,),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                              child: Icon(Icons.email_rounded, size: 40, color: Colors.white,),),
                            Text("19030269@itcelaya.edu.mx", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 20),textAlign: TextAlign.center,),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                              child: Icon(Icons.switch_account_rounded, size: 40, color: Colors.white,),),
                            Text("19030269", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 20),textAlign: TextAlign.center,),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                              child: Icon(Icons.maps_home_work_rounded, size: 40, color: Colors.white,),),
                            Expanded(
                              child:Text("Ingeniería en sistemas computacionales", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 20),textAlign: TextAlign.left,)
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child:Text("Laboratorios inscritos", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 28,fontWeight:FontWeight.bold ),textAlign: TextAlign.center,),

                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Column(
                              children:[
                                Text("Laboratorio de manofacturas", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 20, fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
                                LinearPercentIndicator(
                                  width: 380.0,
                                  lineHeight: 20,
                                  percent: 0.3,
                                  progressColor: Color.fromRGBO(70, 165, 37, 1)
                                )
                              ]

                        )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Column(
                                children:[
                                  Text("Laboratorio de metodos", style: TextStyle(color: Colors.white, fontFamily: "PopPins", fontSize: 20, fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
                                  LinearPercentIndicator(
                                    width: 380.0,
                                    lineHeight: 20,
                                    percent: 0.7,
                                    progressColor: Color.fromRGBO(70, 165, 37, 1)
                                  )
                                ]

                            ))

                      ],
                    ),
                  )),
                ],
              ),
            ),



          ]),
    );
  }
}
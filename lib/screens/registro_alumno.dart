import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sceii/models/alumno.dart';
import 'package:sceii/models/alumnoDatos.dart';
import 'package:sceii/screens/widget.dart';
import 'package:sceii/services/httpService.dart';
import 'package:sceii/tools/Dateformat.dart';

class registroAlumno extends StatefulWidget {
  const registroAlumno({Key? key}) : super(key: key);
  @override
  State<registroAlumno> createState() => _registroAlumnoState();
}

class _registroAlumnoState extends State<registroAlumno> {
  _registroAlumnoState(){
    dateFormat fo = dateFormat();
    //fecha_nac = fo.showDate(DateTime.now());
    fecha_nac= fo.showDate(DateTime.now());
  }
  dateFormat fo = dateFormat();
  var fecha_nac;
  http_service http = http_service();
  datePicker  datePicker_w = datePicker();
  final fechaInicio = DateTime.now();
  alumnoDatos alumDatos = alumnoDatos();
  String dropdownValue ="alumno";
  List<String> usuarios = ["alumno", "docente", "visitante"];

  late getDropdownButton listGenero =
  getDropdownButton(alumDatos.generos[0], alumDatos.generos, alumDatos.genero);
  late getDropdownButton listSemestre =
  getDropdownButton(alumDatos.semestres[0], alumDatos.semestres, alumDatos.semestre);
  late getDropdownButton listCarrera =
  getDropdownButton(alumDatos.carreras[0], alumDatos.carreras, alumDatos.carrera);

  late textFormField nombre = textFormField("Nombre", "Ingrese tu nombre(s)",
      "", Icons.account_circle);
  late textFormField apellidos = textFormField("Apellidos", "Ingrese tu apellidos(s)",
      "", Icons.account_circle);
  textFormField correo = textFormField("Correo", "Ingrese tu correo",
      "Correo incorecto", Icons.email_rounded);
  textFieldPass password = textFieldPass();
  textFormField noControl = textFormField("No. Control", "Ingrese tu no. Control",
      "", Icons.switch_account_rounded);
  textFormField institucion = textFormField("Institucion", "Ingrese tu institución",
      "", Icons.maps_home_work_rounded);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 20, 1),
      appBar: AppBar(
        title: Text("Registro Alumno"),
          centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            tooltip: 'Menu Icon',
            onPressed: () {},
          )
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: <Widget>[
          //Container(
              //margin: EdgeInsets.only(left: 20.0, right: 20.0),
              //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  Container(
                    margin: EdgeInsets.only(left: 100.0, right: 100.0),
                    alignment: Alignment.center,
                    width: 130,
                    height: 100,
                    child: Icon(Icons.school, color: Colors.white, size: 100,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //image: DecorationImage(
                        //  image: AssetImage('assets/alumno.png'),
                          //fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Registrarse", style: TextStyle(fontSize: 28,color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold),),

                          ],
                        ),

                        nombre,
                  apellidos,
                  correo,
                  noControl,
                  institucion,
                  password,
                  listGenero,
                  listCarrera,
                  listSemestre,
                  datePicker_w,
                  Container(
                    width: 200,
                    height: 50,
                    child:
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(70, 165, 37, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Expanded( child: Text("Registrarse",style: TextStyle(color: Colors.white,fontSize:18),textAlign: TextAlign.left)),
                            Icon(Icons.login),
                          ]
                      ),
                      onPressed: () {
                        if(valiAlumno())
                          addAlumno();
                      }))])
                ,
              )]
      ),
    );
  }


  bool valiUser(){
    if(nombre.formKey.currentState!.validate())
      if(apellidos.formKey.currentState!.validate())
        if(correo.formKey.currentState!.validate())
          if(password.formKey.currentState!.validate())
            return true;
    return false;
  }

  bool valiAlumno(){
    if(valiUser())
      if(noControl.formKey.currentState!.validate())
        return true;
    return false;
  }




  void addAlumno(){
    String nombre_a = nombre.controlador;
    print(nombre_a);
    String apellidos_a = apellidos.controlador;
    print(apellidos_a);
    String correo_a = correo.controlador;
    print(correo_a);
    String no_control_a = noControl.controlador;
    print(no_control_a);
    String password_a = password.controlador;
    print(password_a);
    String genero_a = getGenero();
    print(genero_a);
    String carrera_a = getCarrera();
    print(carrera_a);
    String semestre_a = getSemestre();
    print(semestre_a);
    String fecha_a = datePicker_w.fecha_return;
    print(fecha_a);
    alumno Alumno = alumno(nombre_a, apellidos_a, correo_a, no_control_a, password_a,
        genero_a, semestre_a, carrera_a,fecha_a);
    this.http.addAlumno(Alumno);
  }

  String getGenero(){
    String genero = listGenero.control;
    if(genero=="Masculino")
      return "m";
    if(genero=="Femenino")
      return  "f";
    return"o";
  }

  String getCarrera(){
    int index = listCarrera.lista.indexOf(listCarrera.control)+1;
    return index.toString();
  }
  String getSemestre(){
    if(listSemestre.control=="Otro")
      return "13";
    return listSemestre.control;
  }

}
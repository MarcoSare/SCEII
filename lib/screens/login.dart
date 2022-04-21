import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sceii/screens/home_alumno.dart';


import 'dart:convert';
import 'dart:async';

import 'package:sceii/screens/registro.dart';
import 'package:sceii/screens/widget.dart';
import 'package:sceii/services/httpService.dart';

import '../models/alumno.dart';
import '../models/student.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  initData(){

  }
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  http_service http = http_service();
  textFormField correo = textFormField("Correo", "Ingrese tu correo",
      "Usuario o contraseña incorrecta", Icons.email_rounded);
  textFieldPass password = textFieldPass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color.fromRGBO(19, 20, 20, 1),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          children: <Widget>[

            Container(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 60),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  width: 180,
                  height: 180,
                )),
    Container(

      //margin: EdgeInsets.only(left: 20.0, right: 20.0),
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 150),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Iniciar sesión", style: TextStyle(fontSize: 28,color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold),),

                ],
              ),
            correo,
            password,
                Text(
                  'Olvide mi contraseña',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(70, 165, 37, 1)),
                ),
            Container(
              height: 50,
              width: 500,
              //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(70, 165, 37, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  onPressed: () {
                    logear();
                    //showAlu();
                  }),
            ),
            Column(
              children: <Widget>[
                const Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

                TextButton(
                  child: const Text(
                    'Crear una cuenta',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(70, 165, 37, 1)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => regiAlumno()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.facebook_outlined, size: 30,
                          color: Colors.white),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(70, 165, 37, 1)),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.discord_outlined, size: 30,
                          color: Colors.white),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(70, 165, 37, 1)),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.whatsapp_rounded, size: 30,
                          color: Colors.white),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(70, 165, 37, 1)),
                    )
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ))]));
  }


  bool validar() {
      if(correo.formKey.currentState!.validate())
      if(password.formKey.currentState!.validate())
            return true;
      return false;
      //List datos  = await  busca(correo.controlador, password.controlador) ;
      //if(datos.length==0){
        //correo.formKey.currentState!.validate();
        //password.formKey.currentState!.validate();
      //}
      /*else{
         alumno a = alumno(int.parse(datos[0]['id']),
            datos[0]['nombre'],
            datos[0]['apellidos'],
            datos[0]['genero'],
            datos[0]['no_control'],
            datos[0]['carrera'],
            datos[0]['correo'],
            datos[0]['password'],
            datos[0]['semestre']);
         List materia = await  getMaterias(a.id);
       Navigator.push(context,
           MaterialPageRoute(builder: (context) => homeAlumno( Alumno: a,listMaterias:materia)));
      }*/




  }

  Future<void> logear() async {
    if(validar()){
      List datos = await http.logear(correo.controlador, password.controlador);
      if (datos.length==1)
        print("1");
      else{
        correo.error=true;
        password.error=true;
        correo.formKey.currentState!.validate();
        password.formKey.currentState!.validate();
      }

    }
  }
  //void addUser() {
    //var url = "http://192.168.1.106/api/getAlumnos.php";
    //http.post(Uri.parse(url), body: {"nombre": nameController.text});
  //}
/*
   Future<List> busca(String correo, String password) async {
    final response =
    await http.post(Uri.parse("http://192.168.1.106/api/login.php"),
    body:{
      "correo": correo,
      "password": password
    }
    );
    return json.decode(response.body);
  }

  void showAlu() async {
    final response =
        await http.get(Uri.parse("http://192.168.1.106/api/getAlumnos.php"));
    var usuarios = json.decode(response.body);
    print(usuarios.length);
  }

  Future<void> getMate(int id) async {
    print("sdfsdf");
     List listMaterias = await getMaterias(id);
    print(listMaterias.length);
  }

  Future<List> getMaterias(int id) async {
    final response =
    await http.post(Uri.parse("http://192.168.1.106/api/listaMaterias.php"),
        body:{
          "id": id.toString(),
        }
    );
    var lista =  json.decode(response.body);
    print(lista.length);
    return lista;
  }*/
}

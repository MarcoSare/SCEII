import 'package:flutter/material.dart';
import 'package:sceii/screens/home_alumno.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:sceii/screens/registro.dart';
import 'package:sceii/screens/widget.dart';

import '../models/alumno.dart';
import '../models/student.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  textFormField correo = textFormField("Correo", "Ingrese tu correo",
      "Correo incorecto", Icons.email_rounded);
  textFieldPass password = textFieldPass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 50),
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.png',
                  width: 205,
                  height: 205,
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Iniciar sesion',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0), child: correo),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0), child: password),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Olvide mi contraseña',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(112, 173, 71, 1)),
                )),
            Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(112, 173, 71, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  onPressed: () {
                    validar();
                    //showAlu();
                  }),
            ),
            Row(
              children: <Widget>[
                const Text(
                  '¿No tienes una cuenta?',
                  style: TextStyle(color: Colors.white),
                ),
                Flexible(
                child: TextButton(
                  child: const Text(
                    'Crear una cuenta',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(112, 173, 71, 1)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => regiAlumno()));
                  },
                ))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }


  Future<void> validar() async {
    password.formKey.currentState!.save();
    correo.formKey.currentState!.save();
    if(correo.controlador=='')
      correo.formKey.currentState!.validate();
    else
    if(password.controlador=='')
      password.formKey.currentState!.validate();
    else{
      List datos  = await  busca(correo.controlador, password.controlador) ;
      if(datos.length==0){
        correo.formKey.currentState!.validate();
        password.formKey.currentState!.validate();
      }
      else{
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
      }



  }
  }

  void buscar(String correo, String password){

  }
  //void addUser() {
    //var url = "http://192.168.1.106/api/getAlumnos.php";
    //http.post(Uri.parse(url), body: {"nombre": nameController.text});
  //}

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
  }
}

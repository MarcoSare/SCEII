import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sceii/models/alumnoDatos.dart';
import 'package:sceii/screens/widget.dart';

class regiAlumno extends StatefulWidget {
  const regiAlumno({Key? key}) : super(key: key);

  @override
  State<regiAlumno> createState() => _regiAlumnoState();
}

class _regiAlumnoState extends State<regiAlumno> {
  alumnoDatos alumDatos = alumnoDatos();
  textfield textFieldNombre = textfield("Nombre");
  textfield textFieldApellidos = textfield("Apellidos");
  textfield textFieldNoCont = textfield("No. Control");
  textfield textfieldCorreo = textfield("Correo");
  late getDropdownButton listGenero =
      getDropdownButton(alumDatos.generos[0], alumDatos.generos, alumDatos.genero);
  late getDropdownButton listSemestre =
      getDropdownButton(alumDatos.semestres[0], alumDatos.semestres, alumDatos.semestre);
  late getDropdownButton listCarrera =
      getDropdownButton(alumDatos.carreras[0], alumDatos.carreras, alumDatos.carrera);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Crea tu cuenta'),
        backgroundColor: Color.fromRGBO(112, 173, 71, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/alumno.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  textFieldNombre,
                  textFieldApellidos,
                  textFieldNoCont,
                  textfieldCorreo,
                  listGenero,
                  listSemestre,
                  listCarrera,
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(112, 173, 71, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text('Registrar'),
                      onPressed: () {
                        //print("")
                        //print("Semestre:" + listSemestre.control);
                        //print("Genero: " + listGenero.control);
                        //print("Carrera: " + listCarrera.control);
                        //print("Nombre: " + textFieldNombre.controlador.text);
                        addUser();
                      })
                ],
              )),
        ],
      ),
    );
  }

  void addUser() {
    var url = "http://192.168.1.106/api/alumnos.php";
    http.post(Uri.parse(url), body: {
      "nombre": textFieldNombre.controlador.text,
      "apellidos": textFieldApellidos.controlador.text,
      "genero": listGenero.control,
      "no_control": textFieldNoCont.controlador.text,
      "carrera": listCarrera.control,
      "correo": textfieldCorreo.controlador.text,
      "semestre": listSemestre.control
    });
  }
}
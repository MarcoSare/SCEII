import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sceii/screens/lista_alumnos.dart';
import '../models/alumno.dart';
import '../models/student.dart';

class homeAlumno extends StatefulWidget {
  TextEditingController controlador = TextEditingController();
   List listMaterias;
   var Alumno;
   homeAlumno({Key? key, required this.Alumno, required this.listMaterias}) : super(key: key){

   }
  Future<void> getMate(int id) async {
    print("sdfsdf");
    listMaterias = await getMaterias(id);
    print(listMaterias.length);
  }

  Future<List> getMaterias(int id) async {
    final response =
    await http.post(Uri.parse("http://192.168.1.106/api/listaMaterias.php"),
        body:{
          "id": id.toString(),
        }
    );
    return json.decode(response.body);
  }

  @override
  State<homeAlumno> createState() => _homeAlumnoState();
}

class _homeAlumnoState extends State<homeAlumno> {

  _homeAlumnoState(){

  }

  @override
  Widget build(BuildContext context) {
      var codigo;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Bienvenido '+ widget.Alumno.nombre + "id:" + widget.Alumno.id.toString()),
        backgroundColor: Color.fromRGBO(112, 173, 71, 1),
      ),
      drawer: _getDrawer(context),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
        children: <Widget>[
          for(int i=0;widget.listMaterias.length>i;i++)
          _getCard(context,widget.listMaterias[i]['materia'],widget.listMaterias[i]['maestro']),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed:()async{
         await openDialog();
          print("sd");
          setState(()   {
            print("hola");
             widget.listMaterias;
          });
            print("NO KBRON");

    }

      ) ,
    );
  }


  Future<bool?> openDialog()=> showDialog<bool>(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text("Inscribir materia"),
      content: TextField(
        controller: widget.controlador,
        autofocus: true,
      ),
      actions: [
        TextButton(onPressed: () async {
          return  await incribir();
        }, child: Text("Inscribir"),

        )
      ],
    ),
  );

  Future<void> incribir() async {
    bool ban = await veriMateria(widget.controlador.text);
    if(ban){
      final response =
      await http.post(Uri.parse("http://192.168.1.106/api/inscribirMateria.php"),
          body:{
            "id_alumno": widget.Alumno.id.toString(),
            "id_materia" : widget.controlador.text
          }
      );
      widget.listMaterias = await widget.getMaterias(widget.Alumno.id) as List;
      Navigator.of(context).pop();
    }

    else
      print("la materia no existe");
  }



  Future<bool> veriMateria(String id) async {
    final response =
    await http.post(Uri.parse("http://192.168.1.106/api/buscaMateria.php"),
        body:{
          "id": id.toString(),
        }
    );
    var lista =  json.decode(response.body);
    if(lista.length==0)
    return false;
    else
      return true;
  }


  Widget _getCard(BuildContext context, String nombre, String profesor){
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
              Text(nombre,
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Ver datos',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    imprimirDatteles(profesor);
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

  void imprimirDatteles(String profesor){
        print(profesor);
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
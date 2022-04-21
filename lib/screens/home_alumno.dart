import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sceii/screens/lista_actividades.dart';
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
  int _currentIndex = 0;
  _homeAlumnoState(){

  }

  @override
  Widget build(BuildContext context) {
      var codigo;
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 20, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Home"),
        backgroundColor: Colors.transparent
      ),
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
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text("Laboratorios",style: TextStyle(color: Colors.white,fontSize: 26,fontFamily: "Poppins",fontWeight:FontWeight.bold),),
          ),
          //if(widget.listMaterias.length>0)
          //for(int i=0;widget.listMaterias.length>i;i++)
          //_getCard(context,widget.listMaterias[i]['materia'],widget.listMaterias[i]['maestro'])
          if(false)
            Container(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                  'assets/sinMaterias.png',
                  width: 205,
                  height: 205,
                ),
                    Text(
                      "No tienes laboratorios",
                      style: TextStyle(color: Colors.white,fontFamily: "Poppins", fontSize: 26),
                    ),
                    Icon(Icons.help, color: Colors.white, size: 70,)
                  ]
            )),
          _getCard(context,"Laboratorio de manofacturas","El nacho","https://krear3d.com/wp-content/uploads/2019/08/procesos-de-manufactura-tradicional.jpg"),
          _getCard(context,"Laboratorio de ergonomia","El panchito","https://www.onelab.com.ar/images/uploaded/Ergonomia_6.jpeg"),
          _getCard(context,"Laboratorio de Metodos","El luislao","https://tecnosolucionescr.net/templates/yootheme/cache/acreditacion-a78390a4.png"),

        ],
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add,size: 30,),
        backgroundColor: Color.fromRGBO(70, 165, 37, 1),
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


  Widget _getCard(BuildContext context, String nombre, String profesor,String linkImg){
    return Container(
        width: 100,
        height: 150,
        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(linkImg),
            //image: AssetImage("assets/materia1.jpg"),
              fit:BoxFit.cover
          ),

        ),
        child:Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black
                ]
            )),
            child:Card(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children:<Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.star, size: 30,
                        color: Colors.white),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple),
                  ),
            Flexible(
              child: Text(nombre,
                  style: TextStyle(fontSize: 24, color: Colors.white,fontFamily: "Poppins")),
              )])

              /*ElevatedButton(
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
                  })*/
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        )));
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
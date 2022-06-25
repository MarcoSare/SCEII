import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sceii/screens/lista_actividades.dart';
import 'package:sceii/screens/lista_alumnos.dart';
import 'package:sceii/screens/perfil.dart';
import 'package:sceii/screens/prestamos.dart';
import 'package:sceii/screens/sideBar.dart';
import 'package:sceii/screens/model%20widget/widget.dart';
import 'package:sceii/services/httpService.dart';
import '../models/alumno.dart';
import '../models/student.dart';
import 'laboratorio.dart';

class homeAlumno extends StatefulWidget {

   homeAlumno({Key? key}) : super(key: key){}


  @override
  State<homeAlumno> createState() => _homeAlumnoState();
  }

class _homeAlumnoState extends State<homeAlumno> {

  List<Widget> bodyWidgetList=[
    bodyHome(),
    prestamo_herramienta(),
    sideBarPerfil(),
  ];
  late textFormField codigo = textFormField("Codigo", "Ingrese el código",
      "", Icons.text_format);
  late List  listmateria= [];
  TextEditingController controlador = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 20, 1),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
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
                    Icons.format_list_bulleted,
                    color: _currentIndex == 1 ? Color.fromRGBO(112, 173, 71, 1) : Colors.grey
                ),
                label: "Prestamos"
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.settings,
                  color: _currentIndex == 2 ? Color.fromRGBO(112, 173, 71, 1) : Colors.grey
                ),
                label: "Configuracion"
            ),
          ],
        onTap: (int index){
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },

      ),
          //drawer: _getDrawer(context),
      body: bodyWidgetList[_currentIndex],
    );
  }

}

class listMaterias extends StatelessWidget{
  List lista;
  listMaterias(this.lista);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int i){

        return BounceInLeft(
          delay: Duration(microseconds: 100*i),
            child: _getCard(context, lista[i]['nombre'], "https://krear3d.com/wp-content/uploads/2019/08/procesos-de-manufactura-tradicional.jpg")
        );
      }
    );
  }

  Widget _getCard(BuildContext context, String nombre,String linkImg){
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
            child:
    InkWell(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => laboratorio()));
        },
    child:
            Card(
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
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ))));
  }

}
class bodyHome extends StatefulWidget {
  @override
  State<bodyHome> createState() => _bodyHomeState();

}
class _bodyHomeState extends State<bodyHome> {
  late textFormField codigo = textFormField("Codigo", "Ingrese el código",
      "", Icons.text_format);
  late List  listmateria= [];
  bool bandera=true;
  TextEditingController controlador = TextEditingController();
  http_service  httpService = http_service();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Color.fromRGBO(19, 20, 20, 1),
        appBar: AppBar(
            elevation: 0,
            title: Text("Inicio"),
            backgroundColor: Colors.transparent
        ),
        //drawer: _getDrawer(context),
        body: Column(
          //padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text("Laboratorios y Materias",style: TextStyle(color: Colors.white,fontSize: 26,fontFamily: "Poppins",fontWeight:FontWeight.bold),),
            ),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            width: 400,
            child: BounceInLeft(
              delay: Duration(microseconds: 100),
              child: _getCard(context, "Laboratorio de manufactura", "https://i.imgur.com/l5kHdYQ.jpeg")
          )
        )

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
                listmateria;
              });
              print("NO KBRON");

            }

        ) ,
      );
  }
  @override
  void initState()  {
    getMaterias();
    super.initState();
  }

  Future<void> getMaterias() async {
    listmateria =  await httpService.getMaterias(1);
    print("once");
    print("l: " + listmateria.length.toString());
    bandera=false;
  }


  Future<bool?> openDialog()=> showDialog<bool>(

    context: context,
    builder: (context)=>AlertDialog(
      backgroundColor: Color.fromRGBO(23, 32, 42, 1),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),),
      title: Text("Inscribir materia", style: TextStyle(color: Colors.white)),
      content: Container(
        height: 200,
        child: Column(
          children: [
            Text("Escribe el código de acceso", style: TextStyle(color: Colors.white)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: codigo,),
          ],
        ),


        //TextField(
        //controller: controlador,
        //autofocus: true,
        //)

      ),
      actions: [
        Container(
          height: 40,
          width: 110,
          //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(222, 23, 59 , 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'Cancelar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onPressed: () {
                //showAlu();
              }),
        ),
        Container(
          height: 40,
          width: 110,
          //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(70, 165, 37, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'Inscribir',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onPressed: () async {
                return  await incribir();
              }
          ),
        ),
      ],
    ),
  );
  Future<void> incribir() async {
    bool ban = await veriMateria(controlador.text);
    if(ban){
      final response =
      await http.post(Uri.parse("http://192.168.1.106/api/inscribirMateria.php"),
          body:{
            "id_alumno": "1",
            "id_materia" : "2"
          }
      );
      listmateria= await getMaterias() as List;
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


  Widget _getCard(BuildContext context, String nombre,String linkImg){
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
            child:
            InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => laboratorio()));
                },
                child:
                Card(
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
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ))));
  }

  void imprimirDatteles(String profesor){
    print(profesor);
  }


}




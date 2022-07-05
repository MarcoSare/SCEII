import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sceii/screens/home_alumno.dart';
import 'package:sceii/screens/recuperacion%20cuenta/recuperacion_cuenta.dart';
import 'package:sceii/screens/registro/register.dart';

import 'package:sceii/screens/registro.dart';
import 'package:sceii/screens/model%20widget/widget.dart';
import 'package:sceii/services/htpp_servicies/httpService.dart';
import 'package:sceii/utils/responsive.dart';

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
  http_request http = http_request();
  textFormField correo = textFormField("Correo", "Ingrese tu correo",
      "Usuario o contraseña incorrecta", Icons.email_rounded,1,50);
  textFieldPass password = textFieldPass();

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final isTablet = responsive.isTablet;
    return Scaffold(

        backgroundColor: Color.fromRGBO(19, 20, 20, 1),
        body:
        SingleChildScrollView(
          child:Column(
              children: <Widget>[
                Container(
                    margin :  EdgeInsets.fromLTRB(0,responsive.hp(10) , 0, responsive.hp(5)),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logo.png',
                      width: responsive.wp(50),
                      height: responsive.hp(25),
                    )),
                Container(
                  margin: isTablet?EdgeInsets.fromLTRB(0,0 , 0, responsive.hp(10)):null ,
                    constraints: BoxConstraints(
                      maxWidth: responsive.isTablet?responsive.wp(80):responsive.wp(100),
                    ),
                    height: MediaQuery.of(context).orientation==Orientation.portrait? responsive.hp(60):  null,

                    padding:  EdgeInsets.fromLTRB(responsive.wp(7), responsive.hp(3) , responsive.wp(7), responsive.hp(3)),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(23, 32, 42, 1),
                        borderRadius: isTablet?BorderRadius.circular(30):BorderRadius.only( topRight: Radius.circular(30), topLeft: Radius.circular(30))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Iniciar sesión", style: TextStyle(fontSize: responsive.fontSizeTilte,color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold),),

                          ],
                        ),
                        correo,
                        password,
                        Container(

                          child:
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => recuperacionCuenta()));
                                },
                                child: Text(
                                  'Olvide mi contraseña',
                                  style: TextStyle(
                                      fontSize: isTablet?responsive.dp(1.5):responsive.dp(2), color: Color.fromRGBO(70, 165, 37, 1),fontFamily: "Poppins"),
                                ),
                              ),

                        )
                        ,
                        Container(
                          height: isTablet?responsive.dp(3.5):responsive.dp(4),
                          width: responsive.wp(90),
                          //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          //margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(70, 165, 37, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child:  Text(
                                'Entrar',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTablet?responsive.fontSizeSubT:responsive.dp(2.5),fontFamily: "Poppins"),
                              ),
                              onPressed: () {
                                var result = logear();
                                if(result["error"] == "false" ){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => homeAlumno()));
                                }
                                else{
                                  correo.error=true;
                                  correo.msgError = "Usuario o contraseña incorrecta";
                                  correo.formKey.currentState!.validate();
                                  password.error=true;
                                  password.formKey.currentState!.validate();
                                }
                                //showAlu();
                              }),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '¿No tienes una cuenta?',
                              style: TextStyle(color: Colors.white, fontSize: responsive.dp(1.5),fontFamily: "Poppins"),
                            ),

                            TextButton(
                              child:  Text(
                                'Crear una cuenta',
                                style: TextStyle(
                                    fontSize: isTablet?responsive.fontSizeSubT:responsive.dp(2.5), color: Color.fromRGBO(70, 165, 37, 1),fontFamily: "Poppins"),
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => registro()));
                              },
                            ),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: isTablet?responsive.dp(4):responsive.dp(5),
                                  height:  isTablet?responsive.dp(4):responsive.dp(5),
                                  margin: EdgeInsets.fromLTRB(responsive.dp(0.5),  0,responsive.dp(0.5) ,  0),
                                  child: Icon(Icons.facebook_outlined, size: isTablet?responsive.dp(2.5):responsive.dp(3.5),
                                      color: Colors.white),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(70, 165, 37, 1)),
                                ),
                                Container(
                                  width: isTablet?responsive.dp(4):responsive.dp(5),
                                  height: isTablet?responsive.dp(4):responsive.dp(5),
                                  margin: EdgeInsets.fromLTRB(responsive.dp(0.5),  0,responsive.dp(0.5),0),
                                  child: Icon(Icons.discord_outlined, size: isTablet?responsive.dp(2.5):responsive.dp(3.5),
                                      color: Colors.white),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(70, 165, 37, 1)),
                                ),
                                Container(
                                  width: isTablet?responsive.dp(4):responsive.dp(5),
                                  height: isTablet?responsive.dp(4):responsive.dp(5),
                                  margin: EdgeInsets.fromLTRB(responsive.dp(0.5),  0,responsive.dp(0.5),0),
                                  child: Icon(Icons.whatsapp_rounded, size: isTablet?responsive.dp(2.5):responsive.dp(3.5),
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
                    ))]) ,
        )
        );
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
  Map<String, String> logear()  {
    if(correo.controlador == "johan3700@gmail.com" && password.controlador == "123"){

      Map<String, String> mapa = {
        "nombre": "Johan",
        "apellidos" : "Rafas",
        "correo" : "johan3700@gmail.com",
        "clave" :"123",
        "genero" :"m",
        "fecha_nacimiento" :"1999-10-25",
        "no_control" : "19030260",
        "id_carrera" : "1",
        "id_semestre" : "1",
        "error" : "false"
      };
      return mapa;
    }else {
      Map<String, String> mapa = {
        "error" : "true"
      };
      return mapa;
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

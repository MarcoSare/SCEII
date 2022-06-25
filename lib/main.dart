import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sceii/models/alumno.dart';
import 'package:sceii/screens/cuestionario.dart';
import 'package:sceii/screens/editar_perfil.dart';
import 'package:sceii/screens/home_alumno.dart';
import 'package:sceii/screens/home_profesor.dart';
import 'package:sceii/screens/laboratorio.dart';
import 'package:sceii/screens/lista_actividades.dart';
import 'package:sceii/screens/login.dart';

import 'package:sceii/screens/lista_alumnos.dart';
import 'package:sceii/screens/perfil.dart';
import 'package:sceii/screens/prestamos.dart';
import 'package:sceii/screens/sideBar.dart';
import 'package:sceii/screens/registro/register.dart';
import 'package:sceii/screens/registro.dart';
import 'package:sceii/screens/registro/registro_alumno.dart';
import 'package:sceii/screens/registro/registro_docente.dart';
import 'package:sceii/screens/registro/registro_visitante.dart';

import 'screens/sideBar.dart';
//import 'package:untitled2/screens/pagina02.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await inicializacion(null);
  runApp(MyApp());
}

Future inicializacion(BuildContext? context)  async{
  await Future.delayed(Duration(seconds: 2));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es')
      ],
      title: "SCEII",
      home: Scaffold(
        body:login()
        //homeAlumno()

        //login()//sideBarPerfil()
        //homeDocente()
      ),
    );
  }

  //alumno getAlumno(){
    //alumno a = alumno("Marco","Ramirez","19030260@itcelaya.edu.mx","19030260","123","m","5","sistemas","199-10-25");
    //a.id=1;
    //return a;
  //}

  List getlist(){
    List lista =[];
    return lista;
  }
}





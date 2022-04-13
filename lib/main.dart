import 'package:flutter/material.dart';
import 'package:sceii/screens/lista_actividades.dart';
import 'package:sceii/screens/login.dart';
import 'package:sceii/screens/home_profesor.dart';
import 'package:sceii/screens/lista_alumnos.dart';
import 'package:sceii/screens/registro.dart';
//import 'package:untitled2/screens/pagina02.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await inicializacion(null);
  runApp(MyApp());
}

Future inicializacion(BuildContext? context)  async{
  await Future.delayed(Duration(seconds: 3));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SCEII",
      home: Scaffold(
        body: MyStatefulWidget()
      ),
    );
  }
}





import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/alumno.dart';
class http_request{
  String apiURL = "http://192.168.1.106/api-sceii/v1/routes/";



Future<dynamic> get() async{
  dynamic data;
  var response = await http.get(Uri.parse(apiURL));
  if(response.statusCode==200)
    data= jsonDecode(utf8.decode(response.bodyBytes));
  else
    print("Ha ocurrido un error");
  return data;
}

Future<List> logear(String correo, String password) async {
  final response =
  await http.post(Uri.parse(apiURL),
      body:{
        "metodo": "logear",
        "correo": correo,
        "password": password
      }
  );
  print(response.body);
  return json.decode(response.body);
}




Future<List> getMaterias(int id) async {
  final response =
  await http.post(Uri.parse(apiURL),
      body:{
        "metodo": "getMaterias",
        "id_alumno": id.toString(),
      }
  );
  return json.decode(response.body);
}
Future<List> getMateriasDocente(int id) async {
  final response =
  await http.post(Uri.parse(apiURL),
      body:{
        "metodo": "getMateriasDocente",
        "id_docente": id.toString(),
      }
  );
  return json.decode(response.body);
}

Future<void> addMateria(String nombre, String id_docente, String id_semestre) async {
  final response =
  await http.post(Uri.parse(apiURL),
      body:{
        "metodo": "creaMateria",
        "nombre": nombre,
        "id_docente": id_docente,
        "id_semestre": id_semestre
      }
  );
  print(response.body);
  print(response.statusCode);
}




}

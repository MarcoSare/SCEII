import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/alumno.dart';
class http_service{
static const String apiURL = "http://192.168.1.106/api/sceii_api.php";

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
  return json.decode(response.body);
}

Future<void> addAlumno(alumno a) async {
  final response =
      await http.post(Uri.parse(apiURL), body: {
    "metodo" : "insertAlumno",
    "nombre": a.nombre,
    "apellidos": a.apellidos,
     "clave" : a.password,
    "genero": a.genero,
    "no_control": a.noControl,
    "id_carrera": a.carrera,
    "correo": a.correo,
    "id_semestre": a.semestre,
    "fecha_nac" : a.fecha_nac
  });
  print(response.body);
  print(response.statusCode);
}

}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/alumno.dart';
class http_service{
static const String apiURL = "https://overhanded-extensio.000webhostapp.com/bd/sceii_api.php";

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

Future<String> addAlumno(alumno a) async {
  print(a.nombre);
  String url = "https://overhanded-extensio.000webhostapp.com/api-sceii/v1/routes/registro.php?tipo=alumno";

  Map data = {
    "nombre": a.nombre,
    "apellidos": a.apellidos,
    "clave" : a.password,
    "genero": a.genero,
    "no_control": a.noControl,
    "id_carrera": a.carrera,
    "correo": a.correo,
    "id_semestre": a.semestre,
    "fecha_nacimiento" : a.fecha_nac
  };
  //encode Map to JSON
  var body = json.encode(data);
  http.Response response;
  try{
    response =
    await http.post(Uri.parse(url),  headers: {"Content-Type": "application/json"},//No le está enviando los datos
        body: body);
    String jsonsDataString = response.body.toString(); // toString of Response's body is assigned to jsonDataString
    var datas = jsonDecode(jsonsDataString);
    print(datas.toString());
    print(response.statusCode);
    return datas.toString();
  }
  on Exception catch (e){
    return e.toString();
  }

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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sceii/tools/Dateformat.dart';

class prestamo_herramienta extends StatefulWidget {
  const prestamo_herramienta({Key? key}) : super(key: key);

  @override
  State<prestamo_herramienta> createState() => _prestamo_herramientaState();
}

class _prestamo_herramientaState extends State<prestamo_herramienta> {
  dateFormat formatoFecha = dateFormat();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 20, 1),
      appBar: AppBar(
        title: Text("Prestamo de herramienta"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {},
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
        children: <Widget>[
          const Text(
            'Prestamos activos',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          _getCardColor(context, ("Desarmador de cruz "), DateTime(2022, 1, 23), Colors.red),
          _getCardColor(context, ("Taladro"), DateTime(2022, 8, 19), Colors.green),
          _getCardColor(context, ("Llave 17'"), DateTime(2022, 9, 7),Colors.green),
          _getCardColor(context, ("Desarmador plano"), DateTime(2022, 4, 23),Colors.yellow.shade800),
          _getCardColor(context, ("Cegueta"), DateTime(2022, 8, 17),Colors.yellow.shade800),
          _getCardColor(context, ("Martillo"), DateTime(2022, 8, 6),Colors.red),
          _getCardColor(context, ("Desarmador estrella"), DateTime(2022, 8, 10),Colors.yellow.shade800),
          _getCardColor(context, ("Multimetro"), DateTime(2022, 3, 13),Colors.green),
          _getCardColor(context, ("Llave inglesa"), DateTime(2022, 8, 5),Colors.green),
          _getCardColor(context, ("Pinzas de corte"), DateTime(2022, 8, 2),Colors.red),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {},
      ),
    );
  }

  Widget _getCard(BuildContext context, String titulo, DateTime fecha) {
    return Container(
        width: 100,
        height: 150,
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Card(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          color: fecha.isBefore(DateTime.now()) ? Colors.red : Colors.grey[850],
          elevation: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(titulo,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Text(("Fecha limite: " + formatoFecha.showDate(fecha).toString()),
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Text(fecha.isBefore(DateTime.now()) ? "Vencido" : "En tiempo",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }
  Widget _getCardColor(BuildContext context, String titulo, DateTime fecha, Color color) {
    return Container(
        width: 100,
        height: 150,
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Card(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          color: color,
          elevation: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(titulo,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Text(("Fecha limite: " + formatoFecha.showDate(fecha).toString()),
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Text(fecha.isBefore(DateTime.now()) ? "Vencido" : "En tiempo",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));
  }
}

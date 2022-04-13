import 'package:flutter/material.dart';

import 'login.dart';

class textfield extends MyStatefulWidget {
  TextEditingController controlador = TextEditingController();
  String labText;
  bool validate = false;
  textfield(this.labText);
  @override
  State<textfield> createState() => _textfieldState();
  void setdf(){

  }
}
class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(color: Colors.white, fontSize: 20),
    controller: widget.controlador,
    decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Color.fromRGBO(20, 90, 50, 1))),
    errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.red)),
    labelText: "No_control",
    hintText: ("name@example.com"),
    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white60),
    prefixIcon: Icon(Icons.email_rounded, size: 25, color: Colors.white),
    errorText: widget.validate ? 'Value Can\'t Be Empty' : null,
    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
    ));

  }



}

class getDropdownButton extends StatefulWidget {
  String sele;
  List<String> lista;
  String control;

  getDropdownButton(this.sele, this.lista, this.control);

  @override
  State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _getDropdownButtonState extends State<getDropdownButton> {
  String dropdownValue;

  _getDropdownButtonState(this.dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    widget.control = dropdownValue;
    return DropdownButton<String>(
      icon: Icon(Icons.expand_more),
      iconEnabledColor: Colors.white,
      isExpanded: true,
      underline: Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide.none))),
      value: dropdownValue,
      style: TextStyle(color: Colors.white, fontSize: 20),
      dropdownColor: Color.fromRGBO(60, 60, 60, 0.90),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          widget.control = dropdownValue;
        });
      },
      items: widget.lista.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class textFormField extends StatelessWidget {
  var controlador;
  var text="";
  String labText;
  String hintText;
  String msgError;
  IconData icon;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  textFormField(this.labText,this.hintText,this.msgError,this.icon);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
      style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(20, 90, 50, 1))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red)),
          labelText: labText,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white60),
          prefixIcon: Icon(icon, size: 25, color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      onSaved: (value){
        controlador = value;
      },
      validator: (value){
        if(value!.isEmpty){
          return "Llene este campo";
        }
        else
          if(valids(value)){
            return "Usuario o contraseña incorrecta";
          }
      },
    ))
    ;
  }
  bool valids(String cadena){
    if(text  == cadena)
      return false;
    else
      return true;
  }


}
class textFieldPass extends StatefulWidget{
  var visible = true;
  var pass='';
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  var controlador;

  @override
  State<StatefulWidget> createState() => _textFieldPassState();
 //State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _textFieldPassState extends State<textFieldPass> {
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.formKey,
      child:
        TextFormField(
        obscureText: widget.visible,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(20, 90, 50, 1))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red)),
          labelText: "No_control",
          hintText: ("name@example.com"),
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white60),
          prefixIcon: Icon(Icons.vpn_key_sharp, size: 25, color: Colors.white),
          suffixIcon: IconButton(
            icon: widget.visible ?  Icon(Icons.visibility_off, color: Colors.white70,)
                : Icon(Icons.visibility, color: Color.fromRGBO(112, 173, 71, 1)), onPressed: () {setState(() => widget.visible = !widget.visible); },
          ),
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),

        ),
    onSaved: (value){
    widget.controlador = value;
    },
    validator: (value){
    if(value!.isEmpty){
    return "Llene este campo";
    }
    else
    if(valids(value)){
    return "Usuario o contraseña incorrecta";
    }
    }
    ));
  }
    bool valids(String cadena){
    if(widget.pass  == cadena)
    return false;
    else
    return true;
    }

}
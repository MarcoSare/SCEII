import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sceii/tools/Dateformat.dart';

import 'login.dart';





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
    return Container(
      alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Colors.white,
                width: 1.0
            )
        ),
        child: DropdownButton<String>(
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
    ));
  }
}




class textFormField extends StatefulWidget{
  String label;
  String hint;
  String msgError;
  IconData icono;
  var controlador;
  var  error = false;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  textFormField(this.label,this.hint,this.msgError,this.icono){
  }
  @override
  State<StatefulWidget> createState() => _textFormFieldState();
 //State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _textFormFieldState extends State<textFormField> {
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.formKey,
      child:
          Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red)),
          labelText: widget.label,
          hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white60),
          prefixIcon: Icon(widget.icono, size: 25, color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),

        ),
    onSaved: (value){
    widget.controlador = value;
    }, autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value){
    if(value!.isEmpty){
    return "Llene este campo";
    }
    else
    if(widget.error){
    return widget.msgError;
    }
    },
        onChanged: (value) => setState((){
          widget.controlador = value;
          widget.error=false;
        })
    )));
  }
}

class textFieldPass extends StatefulWidget{
  var visible = true;
  var error = false;
  var controlador;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();


  @override
  State<StatefulWidget> createState() => _textFieldPassState();
//State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _textFieldPassState extends State<textFieldPass> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Form(
        key: widget.formKey,
        child:
        TextFormField(
        inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        ],
            obscureText: widget.visible,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red)),
              labelText: "Contraseña",
              hintText: ("Ingrese su contraseña"),
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value){
              if(value!.isEmpty){
                return "Llene este campo";
              }
              else
              if(widget.error){
                return "Usuario o contraseña incorrecta";
              }
            },
            onChanged: (value) => setState(() {
              widget.controlador = value;
              widget.error = false;
            })
        )));
  }
}

class datePicker extends StatefulWidget{
  dateFormat formato = dateFormat();
  var fechaInicio = DateTime.now();
  var  fecha;
  var fecha_return;
  datePicker(){
    formato = dateFormat();
    fecha = formato.showDate(DateTime.now());
    fecha_return = formato.f.format(DateTime.now());
  }
  @override
  State<StatefulWidget> createState() => datePickerState();
}

class datePickerState extends State<datePicker> {
  @override
  Widget build(BuildContext context) {
    return   Container(
        height: 60,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Colors.white,
                width: 1.0
            )
        ),
        child:
        ElevatedButton(

            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
            onPressed: () {
              callDatePicker();
            },
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  Expanded( child: Text(widget.fecha.toString(),style: TextStyle(color: Colors.white,fontSize:18),textAlign: TextAlign.left)),
                  Icon(Icons.calendar_today_sharp),
                ]
            )) );
  }

  void callDatePicker()async{
    var fechaSelec = await getDatePicker();
    setState(() {
      if(fechaSelec!=null){
        widget.fecha = widget.formato.showDate(fechaSelec);
        widget.fecha_return = widget.formato.f.format(fechaSelec);
        widget.fechaInicio = fechaSelec;
      }

    });
  }
  Future<DateTime?> getDatePicker(){
    return showDatePicker(
        locale: const Locale("es", "ES"),
        context: context,
        initialDate: widget.fechaInicio,
        firstDate: DateTime(DateTime.now().year-100),
        lastDate:  DateTime(DateTime.now().year+100),
        builder: (context,child)=>Theme(
          data: ThemeData().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.green,
                onPrimary: Colors.black,
                surface: Colors.lightGreen,
              ),
              dialogBackgroundColor: Colors.black45
          ), child: child!,
        )
    );
  }
}


class textFormField2 extends StatefulWidget{
  String label;
  String hint;
  String msgError;
  IconData icono;
  var controlador;
  var  error = false;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  textFormField2(this.label,this.hint,this.msgError,this.icono){
  }
  @override
  State<StatefulWidget> createState() => _textFormField2State();
//State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _textFormField2State extends State<textFormField2> {
  @override
  Widget build(BuildContext context) {
    return  Form(
        key: widget.formKey,
        child:
        Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: widget.label,
                  hintText: widget.hint,
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white60),
                  prefixIcon: Icon(widget.icono, size: 25, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),

                ),
                onSaved: (value){
                  widget.controlador = value;
                }, autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  if(value!.isEmpty){
                    return "Llene este campo";
                  }
                  else
                  if(widget.error){
                    return widget.msgError;
                  }
                },
                onChanged: (value) => setState((){
                  widget.controlador = value;
                  widget.error=false;
                })
            )));
  }
}

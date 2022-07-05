import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sceii/tools/Dateformat.dart';

import '../../utils/responsive.dart';

class getDropdownButton extends StatefulWidget {
  String sele;
  List<String> lista;
  String control;
  String label;

  getDropdownButton(this.sele, this.lista, this.control, this.label);

  @override
  State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _getDropdownButtonState extends State<getDropdownButton> {
  String dropdownValue;

  _getDropdownButtonState(this.dropdownValue) {}

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    bool isTablet = responsive.isTablet;
    double marginTB = responsive.dp(0.4);
    widget.control = dropdownValue;
    return Container(
      alignment: Alignment.center,
        margin:  EdgeInsets.fromLTRB(0, marginTB, 0, marginTB),

        child: DropdownButtonFormField<String>(

      icon: Icon(Icons.expand_more),
      iconEnabledColor: Colors.white,
      isExpanded: true,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)),
              labelText: widget.label,
            labelStyle: TextStyle(color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2),fontFamily: "PopPins")
          ),

      value: dropdownValue,
      style: TextStyle(color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2),fontFamily: "PopPins"),
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
  int inputType;
  int lenght;
  IconData icono;
  var controlador;
  var  error = false;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  textFormField(this.label,this.hint,this.msgError,this.icono,this.inputType,this.lenght){
  }
  @override
  State<StatefulWidget> createState() => _textFormFieldState();
 //State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _textFormFieldState extends State<textFormField> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    bool isTablet = responsive.isTablet;
    double marginTB = responsive.dp(0.4);
    return  Form(
      key: widget.formKey,
      child:
          Container(
              margin:  EdgeInsets.fromLTRB(0, marginTB, 0, marginTB),
            child: TextFormField(
                textInputAction: TextInputAction.next,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.lenght),
            ],
        style:  TextStyle(color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2),fontFamily: "PopPins"),
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

          hintStyle: TextStyle(fontSize: isTablet?responsive.dp(1.5):responsive.dp(2), color: Colors.white60),
          prefixIcon: Container(
              margin:  EdgeInsets.fromLTRB(responsive.wp(1), 0, responsive.wp(1), 0),
              child:
              Icon(widget.icono, size: responsive.dp(3), color: Colors.white)
          ),
          labelStyle: TextStyle(color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2)),
          errorStyle:   TextStyle(color: Colors.red, fontSize: responsive.dp(1.5)),
        ),
                keyboardType: widget.inputType==0?TextInputType.number:TextInputType.text,
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
    final Responsive responsive = Responsive.of(context);
    bool isTablet = responsive.isTablet;
    double marginTB = responsive.dp(0.5);
    if(isTablet)
        marginTB = responsive.dp(0.4);

    return  Container(
        margin: EdgeInsets.fromLTRB(0, marginTB, 0, marginTB),

        child: Form(
        key: widget.formKey,
        child:
        TextFormField(
            textInputAction: TextInputAction.next,
        inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        ],
            obscureText: widget.visible,
            style: TextStyle(color: Colors.white, fontSize: responsive.dp(2),fontFamily: "PopPins"),
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
              hintStyle: TextStyle(fontSize: isTablet?responsive.dp(1.5):responsive.dp(2), color: Colors.white60),
              prefixIcon:
              Container(
                margin:  EdgeInsets.fromLTRB(responsive.wp(1), 0, responsive.wp(1), 0),
                child: Icon(Icons.vpn_key_sharp, size: responsive.dp(3), color: Colors.white),
              ),

              suffixIcon: IconButton(
                icon: widget.visible ?  Icon(Icons.visibility_off, color: Colors.white70,)
                    : Icon(Icons.visibility, color: Color.fromRGBO(112, 173, 71, 1)), onPressed: () {setState(() => widget.visible = !widget.visible); },
              ),
              labelStyle: TextStyle(color: Colors.white, fontSize:  isTablet?responsive.dp(1.5):responsive.dp(2)),
              errorStyle: TextStyle(color: Colors.red, fontSize: responsive.dp(1.5)),

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
  String label;
  datePicker(this.label){
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

      child: InputDecorator(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.white),
        ),
        child: ElevatedButton(

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
            ))
      ),
        /*
       decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color.fromRGBO(112, 173, 71, 1))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)),
              labelText: widget.label,
            labelStyle: TextStyle(color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2),fontFamily: "PopPins")
          )

         */
        );
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
  String inicial;
  String label;
  String hint;
  String msgError;
  IconData icono;
  var controlador;
  var  error = false;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  textFormField2(this.inicial,this.label,this.hint,this.msgError,this.icono){
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
              initialValue: widget.inicial,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
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

class textChangedPass extends StatefulWidget{
  String inicial;
  String label;
  String hint;
  String msgError;
  IconData icono;
  var visible = true;
  var controlador;
  var  error = false;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  textChangedPass(this.inicial,this.label,this.hint,this.msgError,this.icono){
  }
  @override
  State<StatefulWidget> createState() => _textChangedPassState();
//State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _textChangedPassState extends State<textChangedPass> {
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
                obscureText: widget.visible,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  suffixIcon: IconButton(
                    icon: widget.visible ?  Icon(Icons.visibility_off, color: Colors.white70,)
                        : Icon(Icons.visibility, color: Color.fromRGBO(112, 173, 71, 1)), onPressed: () {setState(() => widget.visible = !widget.visible); },
                  ),
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


class DropdownImg extends StatefulWidget {
  late String control;

  DropdownImg();

  @override
  State<DropdownImg> createState() => _DropdownImgState();
}

class _DropdownImgState extends State<DropdownImg> {
  String dropdownValue = "Imagen 1";

  _DropdownImgState() {}

  @override
  Widget build(BuildContext context) {
    widget.control = dropdownValue;
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/img_"+widget.control.split(" ")[1]+".jpg"),
                fit:BoxFit.cover
            ),
            border: Border.all(
                color: Colors.white,
                width: 1.0
            )
        ),
        child:
            Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black
                            ]
                        )),
              child:
          Column(
            children: [
              DropdownButton<String>(
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
                items: [
                  "Imagen 1",
                  "Imagen 2",
                  "Imagen 3",
                  "Imagen 4",
                  "Imagen 5",
                  "Imagen 6",
                  "Imagen 7",
                  "Imagen 8",
                  "Imagen 9",
                  "Imagen 10",
    ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ))
       );
  }
}
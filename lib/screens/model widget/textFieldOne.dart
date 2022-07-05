import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/responsive.dart';

class textFieldOne extends StatefulWidget{
  var visible = true;
  var controlador;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();


  @override
  State<StatefulWidget> createState() => _textFieldOneState();
//State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _textFieldOneState extends State<textFieldOne> {
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
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              style:  TextStyle( color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2),fontFamily: "PopPins"),
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
                hintStyle: TextStyle(fontSize: isTablet?responsive.dp(1.5):responsive.dp(2), color: Colors.white60),
                labelStyle: TextStyle(color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2)),
                errorStyle:   TextStyle(color: Colors.red, fontSize: responsive.dp(1.5)),
              ),
                onSaved: (value){
                  widget.controlador = value;
                }, autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  if(value!.isEmpty){
                    return "";
                  }
                },
                onChanged: (value) => setState((){
                  widget.controlador = value;
                })
            )

        ));
  }
}
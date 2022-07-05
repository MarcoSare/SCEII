
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/responsive.dart';

class emailFormField extends StatefulWidget{
  String label;
  String hint;
  String msgError;
  var controlador;
  var  error = false;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  emailFormField(this.label,this.hint,this.msgError){
  }
  @override
  State<StatefulWidget> createState() => _emailFormFieldState();
//State<getDropdownButton> createState() => _getDropdownButtonState(sele);
}

class _emailFormFieldState extends State<emailFormField> {
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
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                textInputAction: TextInputAction.next,
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
                      Icon(Icons.email, size: responsive.dp(3), color: Colors.white)
                  ),
                  labelStyle: TextStyle(color: Colors.white, fontSize: isTablet?responsive.dp(1.5):responsive.dp(2)),
                  errorStyle:   TextStyle(color: Colors.red, fontSize: responsive.dp(1.5)),
                ),
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
                onSaved: (value){
                  widget.controlador = value;
                }, autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  if(value!.isEmpty){
                    return "Llene este campo";
                  }
                  else
                    if(!EmailValidator.validate(value)){
                      return "Introduzca un correo electrónico válido";
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
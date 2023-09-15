import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key,this.validation,  this.label, this.obscureText, required this.controller, this.inputType, this.onChanged}) : super(key: key);
  final String? label;
  final bool? obscureText;
  final TextEditingController controller;
  final TextInputType? inputType;

   final void Function(String)? onChanged;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [

          Align(alignment: Alignment.topLeft,child: Text(label ?? "Not Found", style: TextStyle(fontSize: 15),)),
          SizedBox(height: 5,),
          TextFormField(
            autovalidateMode:  AutovalidateMode.onUserInteraction,
            validator: validation,
            keyboardType: inputType ?? TextInputType.text,
            cursorColor: Colors.black,
            controller: controller,
            onChanged: (value) {
              onChanged!(value);
            },
            obscureText: obscureText ?? false,
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              fillColor: Colors.white,
              focusedBorder:  OutlineInputBorder(
                borderRadius:  BorderRadius.circular(5.0),
                borderSide:  BorderSide(color: Colors.black, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(5.0),
                borderSide:  BorderSide(color: Colors.black, width: 1),
              ),
              //fillColor: Colors.green
            ),

          ),

        ],
      ),
    );
  }
}

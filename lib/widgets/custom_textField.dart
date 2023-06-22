import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({ required this.onChanged, required this.labelText, required  this.obscureText});
  String labelText;
  bool obscureText;
 Function(String) ?onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText:obscureText,
                validator: (data) {
                 if (data!.isEmpty) {
                   return 'field is required';
                 }   else{}
                  } ,
                onChanged: onChanged,
                decoration: InputDecoration(
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                            labelText: labelText),
                ),
           );
  }
}
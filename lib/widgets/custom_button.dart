import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.OnClick, required this.TextButton});
String TextButton;
VoidCallback? OnClick;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 400,height: 60,
                decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(18),),
                child: ElevatedButton(
                onPressed: OnClick,
                  child: Text( TextButton,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                           
                    )),
              );
  }
}
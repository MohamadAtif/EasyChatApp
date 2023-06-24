import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.OnClick, required this.TextButton});
String TextButton;
VoidCallback? OnClick;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:  OnClick,
      child: Container(
        width: 400,height: 60,
                  decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(18),),
                    child: Center(
                      child: Text( TextButton,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'Kanit'),
                               
                        ),
                    )
                ),
    );
  }
}
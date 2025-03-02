
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Color colorGreen = Color.fromRGBO(74, 175, 64, 1.0);
Color colorRed = Color.fromRGBO(241, 58, 73, 1.0);
Color colorWhite = Color.fromRGBO(246, 248, 246, 1.0);
Color colorBlack = Color.fromRGBO(0, 7, 0, 1.0);
Color colorContainer = Color.fromRGBO(205, 248, 205, 1.0);

SliverGridDelegate sliverGridDelegate(){
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    mainAxisSpacing: 5,
    crossAxisSpacing: 5,
    mainAxisExtent: 300
  );
}

BoxDecoration boxDecoration(){
  return BoxDecoration(
    color: colorContainer,
    borderRadius: BorderRadius.circular(8)
  );
}

InputDecoration inputDecoration({required hintText,required labelText}){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(),
    hintText: hintText,
    labelText: labelText,
    border: OutlineInputBorder(),
  );
}

elevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: colorGreen,
    foregroundColor: colorWhite
  );
}
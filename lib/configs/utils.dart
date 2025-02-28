
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils{
   //functions to help 



   //for example 
   // generic toast message imported from toast package
   // we will utilise this for showing errors or success messages
   static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
    backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}